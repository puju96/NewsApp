//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Apple on 24/05/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController , UIWebViewDelegate{
    
    @IBOutlet weak var webview: UIWebView!
    var urlString : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webview.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Latest News"
        
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webview.loadRequest(request)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if webview.isLoading {
            webview.stopLoading()
        }
    }

   
}
