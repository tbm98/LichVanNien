//
//  ChiTietVanKhan.swift
//  LichVanNien
//
//  Created by TBM on 6/25/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class ChiTietVanKhan: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Bundle.main.url(forResource: "vankhan_\(Const.indexVanKhan)", withExtension: "html") {
            webView.loadRequest(URLRequest(url: url))
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
