//
//  NhieuHonViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit
import StoreKit
import GoogleMobileAds

class NhieuHon: UIViewController ,GADInterstitialDelegate{
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnShare(_ sender: Any) {
        Const.countAction = Const.countAction + 1
        let image:[Any] = [UIApplication.shared.screenShot as Any]
        let activityVC = UIActivityViewController(activityItems: image, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    @IBOutlet weak var viewVanKhan: UIView!
    @IBOutlet weak var viewTuVi: UIView!
    @IBOutlet weak var viewThoiTiet: UIView!
    @IBOutlet weak var viewDanhGia: UIView!
    @IBOutlet weak var viewChiaSe: UIView!
    
    
    @IBOutlet weak var imageBackground: UIImageView!
    
    func setClick(){
        viewVanKhan.isUserInteractionEnabled = true
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(actionVanKhan(tapGestureRecognizer:)))
        viewVanKhan.addGestureRecognizer(tapGesture1)
        
        viewTuVi.isUserInteractionEnabled = true
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(actionTuVi(tapGestureRecognizer:)))
        viewTuVi.addGestureRecognizer(tapGesture2)
        
        viewThoiTiet.isUserInteractionEnabled = true
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(actionThoiTiet(tapGestureRecognizer:)))
        viewThoiTiet.addGestureRecognizer(tapGesture3)
        
        viewDanhGia.isUserInteractionEnabled = true
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(actionDanhGia(tapGestureRecognizer:)))
        viewDanhGia.addGestureRecognizer(tapGesture4)
        
        viewChiaSe.isUserInteractionEnabled = true
        let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(actionChiaSe(tapGestureRecognizer:)))
        viewChiaSe.addGestureRecognizer(tapGesture5)
    }
    
    @objc func actionVanKhan(tapGestureRecognizer: UITapGestureRecognizer) {
        print("van khan")
        Const.countAction = Const.countAction + 1
        if interstitial.isReady && Const.countAction >= 5{
            interstitial.present(fromRootViewController: self)
            Const.countAction = 0
        }
        let vankhan = (storyboard?.instantiateViewController(withIdentifier: "vk"))!
        
        //UIApplication.topViewController()?.present(vankhan, animated: true, completion: nil)
        self.present(vankhan, animated: true, completion: nil)
        
    }
    @objc func actionTuVi(tapGestureRecognizer: UITapGestureRecognizer) {
        print("tu vi")
        Const.countAction = Const.countAction + 1
        if interstitial.isReady && Const.countAction >= 5{
            interstitial.present(fromRootViewController: self)
            Const.countAction = 0
        }
        let tuvi = (storyboard?.instantiateViewController(withIdentifier: "tuvi"))!
        
        //UIApplication.topViewController()?.present(vankhan, animated: true, completion: nil)
        self.present(tuvi, animated: true, completion: nil)
    }
    @objc func actionThoiTiet(tapGestureRecognizer: UITapGestureRecognizer) {
        print("thoi tiet")
        Const.countAction = Const.countAction + 1
        if interstitial.isReady && Const.countAction >= 5{
            interstitial.present(fromRootViewController: self)
            Const.countAction = 0
        }
        let thoitiet:UIViewController = (storyboard?.instantiateViewController(withIdentifier: "thoitiet"))!
        self.present(thoitiet, animated: true, completion: nil)
    }
    
    func rateApp(){
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        } else {
            guard let url = URL(string: "itms-apps://itunes.apple.com/app/id1253533671") else {
                return
            }
            
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
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
    @objc func actionDanhGia(tapGestureRecognizer: UITapGestureRecognizer) {
        print("danh gia")
        Const.countAction = Const.countAction + 1
        if interstitial.isReady && Const.countAction >= 5{
            interstitial.present(fromRootViewController: self)
            Const.countAction = 0
        }
        //rateApp()
        rateApp(appId: "id1147613120")
//        guard let url = URL(string: "https://itunes.apple.com/us/app/tap-dont-tap/id955251145?l=es&ls=1&mt=8") else {
//            return
//        }
//
//        if #available(iOS 10.0, *) {
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        } else {
//            UIApplication.shared.openURL(url)
//        }
    }
    @objc func actionChiaSe(tapGestureRecognizer: UITapGestureRecognizer) {
        print("chia se")
        Const.countAction = Const.countAction + 1
        if interstitial.isReady && Const.countAction >= 5{
            interstitial.present(fromRootViewController: self)
            Const.countAction = 0
        }
        let image:[Any] = [UIApplication.shared.screenShot as Any]
        let activityVC = UIActivityViewController(activityItems: image, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    var bannerView: GADBannerView!
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoadInterstitial()
        print("dismis")
    }
    func createAndLoadInterstitial() -> GADInterstitial {
        var interstitial = GADInterstitial(adUnitID: Const.interstitialId)
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    var interstitial: GADInterstitial!
    override func viewDidLoad() {
        super.viewDidLoad()
        setClick()
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        
        addBannerViewToView(bannerView)
        bannerView.adUnitID = Const.bannerId
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        interstitial = createAndLoadInterstitial()
    }
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }


}
