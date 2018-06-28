//
//  ChiTietTuVi.swift
//  LichVanNien
//
//  Created by TBM on 6/26/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class ChiTietTuVi: UIViewController {
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var titletuvi: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titletuvi.title = Const.titleTuVi
        webview.loadRequest(URLRequest(url: URL(string: Const.linkTuVi)!))

        // Do any additional setup after loading the view.
    }


}
