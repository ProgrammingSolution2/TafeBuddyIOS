//
//  TimeTable.swift
//  Tafe Buddy
//
//  Created by Hai on 29/5/17.
//  Copyright © 2017 Ti Chuot. All rights reserved.
//

import UIKit

class TimeTable: UIViewController {

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var timeTableWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url  = URL(string:"https://my.tafesa.edu.au/PROD/bwskfshd.P_CrseSchd")
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
