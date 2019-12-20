//
//  WebViewController.swift
//  mcKinseyProject
//
//  Created by shubham tyagi on 20/12/19.
//  Copyright © 2019 shubham tyagi. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKUIDelegate {
    
    var token:String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeStatusBarColor()
        self.webViewUI()
    }
    //MARK: WEBVIEW UI
    func webViewUI(){
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        self.view.addSubview(webView)
       
        let url = URL(string: "https://www.mckinleyrice.com?token=\(token)*")
        webView.load(URLRequest(url: url!))
    }
}
