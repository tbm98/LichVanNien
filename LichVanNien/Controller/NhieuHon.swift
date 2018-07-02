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
        mode = 6
        if(Const.countAction >= 5 && (Date().millisecondsSince1970 - Const.timeRepeat > 180000)){
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
                Const.countAction = 0
                Const.timeRepeat = Date().millisecondsSince1970
            } else {
                print("Ad wasn't ready")
                mode6()
            }
            
        }else{
            mode6()
        }
    }
    func mode6(){
        let image:[Any] = [UIApplication.shared.screenShot as Any]
        let activityVC = UIActivityViewController(activityItems: image, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    @IBAction func btnLichCaNhan(_ sender: Any) {
        Const.countAction = Const.countAction + 1
        mode = 7
        if(Const.countAction >= 5 && (Date().millisecondsSince1970 - Const.timeRepeat > 180000)){
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
                Const.countAction = 0
                Const.timeRepeat = Date().millisecondsSince1970
            } else {
                print("Ad wasn't ready")
                mode7()
            }
            
        }else{
            mode7()
        }
    }
    func mode7(){
        let lichcanhan:UIViewController = (storyboard?.instantiateViewController(withIdentifier: "lichcanhan"))!
        self.present(lichcanhan, animated: true, completion: nil)
    }
    @IBOutlet weak var viewVanKhan: UIView!
    @IBOutlet weak var viewTuVi: UIView!
    @IBOutlet weak var viewThoiTiet: UIView!
    @IBOutlet weak var viewDanhGia: UIView!
    @IBOutlet weak var viewChiaSe: UIView!
    @IBOutlet weak var stack1: UIStackView!
    @IBOutlet weak var stack2: UIStackView!
    @IBOutlet weak var stack3: UIStackView!
    
    var mode = 1
    
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
        mode = 1
        if(Const.countAction >= 5 && (Date().millisecondsSince1970 - Const.timeRepeat > 180000)){
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
                Const.countAction = 0
                Const.timeRepeat = Date().millisecondsSince1970
            } else {
                print("Ad wasn't ready")
                mode1()
            }
            
        }else{
            mode1()
        }
        
        
        
    }
    func mode1(){
        let vankhan = (storyboard?.instantiateViewController(withIdentifier: "vk"))!
        
        //UIApplication.topViewController()?.present(vankhan, animated: true, completion: nil)
        self.present(vankhan, animated: true, completion: nil)
    }
    @objc func actionTuVi(tapGestureRecognizer: UITapGestureRecognizer) {
        print("tu vi")
        Const.countAction = Const.countAction + 1
        mode = 2
        if(Const.countAction >= 5 && (Date().millisecondsSince1970 - Const.timeRepeat > 180000)){
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
                Const.countAction = 0
                Const.timeRepeat = Date().millisecondsSince1970
            } else {
                print("Ad wasn't ready")
                mode2()
            }
            
        }else{
            mode2()
        }
        
        
    }
    func mode2(){
        let tuvi = (storyboard?.instantiateViewController(withIdentifier: "tuvi"))!
        
        //UIApplication.topViewController()?.present(vankhan, animated: true, completion: nil)
        self.present(tuvi, animated: true, completion: nil)
    }
    @objc func actionThoiTiet(tapGestureRecognizer: UITapGestureRecognizer) {
        print("thoi tiet")
        Const.countAction = Const.countAction + 1
        mode = 3
        if(Const.countAction >= 5 && (Date().millisecondsSince1970 - Const.timeRepeat > 180000)){
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
                Const.countAction = 0
                Const.timeRepeat = Date().millisecondsSince1970
            } else {
                print("Ad wasn't ready")
                mode3()
            }
            
        }else{
            mode3()
        }
        
        
    }
    
    func mode3(){
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
        mode = 4
        if(Const.countAction >= 5 && (Date().millisecondsSince1970 - Const.timeRepeat > 180000)){
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
                Const.countAction = 0
                Const.timeRepeat = Date().millisecondsSince1970
            } else {
                print("Ad wasn't ready")
                mode4()
            }
            
        }else{
            mode4()
        }

        
    }
    func mode4(){
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
        mode = 5
        if(Const.countAction >= 5 && (Date().millisecondsSince1970 - Const.timeRepeat > 180000)){
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
                Const.countAction = 0
                Const.timeRepeat = Date().millisecondsSince1970
            } else {
                print("Ad wasn't ready")
                mode5()
            }
            
        }else{
            mode5()
        }
        
        
    }
    func mode5(){
        let image:[Any] = [UIApplication.shared.screenShot as Any]
        let activityVC = UIActivityViewController(activityItems: image, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    var bannerView: GADBannerView!
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoadInterstitial()
        print("dismis")
        switch mode {
        case 1:
            mode1()
        case 2:
            mode2()
        case 3:
            mode3()
        case 4:
            mode4()
        case 5:
            mode5()
        case 6:
            mode6()
        case 7:
            mode7()
        default:
            break
        }
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
        bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait
)
        
        addBannerViewToView(bannerView)
        bannerView.adUnitID = Const.bannerId
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        interstitial = createAndLoadInterstitial()
        if(self.view.frame.height<700){
            stack1.spacing = (30 as CGFloat).dp
            stack2.spacing = (30 as CGFloat).dp
            stack3.spacing = (30 as CGFloat).dp
        }else{
            stack1.spacing = (50 as CGFloat).dp
            stack2.spacing = (50 as CGFloat).dp
            stack3.spacing = (50 as CGFloat).dp
        }
        
        
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
