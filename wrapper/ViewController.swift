//
//  ViewController.swift
//  wrapper
//
//  Created by Imagina on 10/02/22.
//
import WebKit

import UIKit

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    @IBOutlet weak var wrapperView: WKWebView!
    var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Instance URL to wrap
        let url = URL(string: "https://signosmed.com")
        
        //Add Wrap view
        wrapperView.navigationDelegate = self
        wrapperView.uiDelegate = self
        view.addSubview(wrapperView)

        //Add activity indicator view
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        view.addSubview(activityIndicator)

        //Load URL
        wrapperView.load(URLRequest(url: url!))
    }
    
    //Actions to turn the activity indicator
    func showActivityIndicator(show: Bool) {
        if show {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        showActivityIndicator(show: false)
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showActivityIndicator(show: true)
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        showActivityIndicator(show: false)
    }
}

