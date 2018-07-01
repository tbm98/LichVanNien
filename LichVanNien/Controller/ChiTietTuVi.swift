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
    @IBAction func btnShare(_ sender: Any) {
        let image:[Any] = [UIApplication.shared.screenShot as Any]
        let activityVC = UIActivityViewController(activityItems: image, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    fileprivate func rateApp(appId: String) {
        openUrl("itms-apps://itunes.apple.com/us/app/id1253533671")
    }
    fileprivate func openUrl(_ urlString:String) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    @IBAction func btnDanhGia(_ sender: Any) {
        rateApp(appId: "appid")
//        guard let url = URL(string: "itms-apps://itunes.apple.com/app/id1253533671") else {
//            return
//        }
//
//        if #available(iOS 10.0, *) {
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        } else {
//            UIApplication.shared.openURL(url)
//        }
    }
    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var titletuvi: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titletuvi.title = Const.titleTuVi
        var request = URLRequest(url: URL(string: Const.linkTuVi)!)
        request.addValue("script-src none", forHTTPHeaderField: "X-WebKit-CSP")
        webview.loadRequest(request)

        // Do any additional setup after loading the view.
    }


}
