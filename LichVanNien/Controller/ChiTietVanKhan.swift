//
//  ChiTietVanKhan.swift
//  LichVanNien
//
//  Created by TBM on 6/25/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class ChiTietVanKhan: UIViewController ,UIWebViewDelegate{
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var webView: UIWebView!
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("Start load")
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("finish load")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Const.indexVanKhan = 1
        let url = Bundle.main.url(forResource: "vankhan_\(Const.indexVanKhan)", withExtension: "html")
        //let url = Bundle.main.url(forResource: "vankhan_3", withExtension: "html")
        //let url = Bundle.main.url(forResource: "Html/vankhan_2", withExtension:"html")
        let request = NSURLRequest(url: url!)
        webView.loadRequest(request as URLRequest)
        //webView.loadRequest(URLRequest(url: url!))
        
        // Do any additional setup after loading the view.
    }


}
