//
// oneNote.swift
//
// Created by Jonty Svanborg 2/6/2017

import UIKit

class OneNote: UIViewController
{
	@IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var timeTableWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url  = URL(string:"https://www.onenote.com/notebooks?session=f3dc3e95-ea68-4957-b69f-b028f7593d2e&auth=2")
        let requestObject = URLRequest(url: url!)
        self.timeTableWebView.loadRequest(requestObject)
        timeTableWebView.scrollView.bounces = false
        self.navigationController?.navigationBar.isTranslucent = false
        //navigationController?.navigationBar.barTintColor = UIColor.red
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //self.navigationController?.hidesBarsOnSwipe = true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView){
        loadingIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView){
        loadingIndicator.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error){
        
    }
}