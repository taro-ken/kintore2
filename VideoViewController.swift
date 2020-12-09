//
//  VideoViewController.swift
//  kintore2
//
//  Created by 木元健太郎 on 2020/09/05.
//  Copyright © 2020 kimoto kentaro. All rights reserved.
//

import UIKit
import WebKit

class VideoViewController: UIViewController,WKNavigationDelegate{
    
    var webView = WKWebView()
    
    @IBOutlet weak var indicatar: UIActivityIndicatorView!
    
    @IBOutlet weak var toolBar: UIToolbar!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        webView.navigationDelegate = self
        
        //実体になっている
        
        //大きさ
        webView.frame = CGRect(x: 0, y: toolBar.frame.size.height, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height+2)
        view.addSubview(webView)
        //何をロードするのか
        webView.navigationDelegate = self
         let url = URL(string: "https://www.youtube.com/")
        let request = URLRequest(url: url!)
        webView.load(request)
        
        
        
        //どこにつけるのか
        
        
    }

    //ロードが開始されたとき
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("読み込み開始")
        indicatar.startAnimating()
    }
    
    //ロードが完了したとき
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("ロード完了")
        
        indicatar.stopAnimating()
        
    }
    
    
    

    
    @IBAction func go(_ sender: Any) {
         webView.goForward()
    }
    
    
    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    
    
}

