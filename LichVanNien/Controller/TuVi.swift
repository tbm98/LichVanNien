//
//  TuVi.swift
//  LichVanNien
//
//  Created by TBM on 6/26/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit
import GoogleMobileAds


class TuVi: UIViewController ,GADInterstitialDelegate{
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var stack2: UIStackView!
    @IBAction func btnShare(_ sender: Any) {
       
        
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
    @IBOutlet weak var stack1: UIStackView!
    func mode5(){
        let image:[Any] = [UIApplication.shared.screenShot as Any]
        let activityVC = UIActivityViewController(activityItems: image, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    @IBAction func btnDanhGia(_ sender: Any) {
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
    func mode6(){
        //
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
    @IBOutlet weak var viewHomNay: UIView!
    @IBOutlet weak var viewGioTot: UIView!
    @IBOutlet weak var viewNgayTot: UIView!
    @IBOutlet weak var viewAmDuong: UIView!
    var mode = 1
    
    @IBOutlet weak var stack3: UIStackView!
    
    func initTap(){
        viewHomNay.isUserInteractionEnabled = true
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(actionHomNay(tapGestureRecognizer:)))
        viewHomNay.addGestureRecognizer(tapGesture1)

        viewGioTot.isUserInteractionEnabled = true
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(actionGioTot(tapGestureRecognizer:)))
        viewGioTot.addGestureRecognizer(tapGesture2)

        viewNgayTot.isUserInteractionEnabled = true
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(actionNgayTot(tapGestureRecognizer:)))
        viewNgayTot.addGestureRecognizer(tapGesture3)

        viewAmDuong.isUserInteractionEnabled = true
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(actionAmDuong(tapGestureRecognizer:)))
        viewAmDuong.addGestureRecognizer(tapGesture4)
    }
    
    
    @objc func actionHomNay(tapGestureRecognizer: UITapGestureRecognizer) {
        print("hn")
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
        Const.titleTuVi = "Tử Vi Hôm Nay"
        Const.linkTuVi = "http://tracuu.tuvisomenh.com/xem-ngay-tot-xau"
        show()
    }
    @objc func actionGioTot(tapGestureRecognizer: UITapGestureRecognizer) {
        print("gt")
        
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
        Const.titleTuVi = "Giờ Tốt Hôm Nay"
        Const.linkTuVi = "http://tracuu.tuvisomenh.com/xem-ngay-tot-xau/xem-gio-tot-trong-ngay"
        show()
    }
    @objc func actionNgayTot(tapGestureRecognizer: UITapGestureRecognizer) {
        
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
        Const.titleTuVi = "Ngày Tốt Trong Tháng"
        Const.linkTuVi = "http://tracuu.tuvisomenh.com/xem-ngay-tot-xau/xem-ngay-tot-xau-trong-thang"
        show()
    }
    @objc func actionAmDuong(tapGestureRecognizer: UITapGestureRecognizer) {

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
        Const.titleTuVi = "Âm Dương Của Ngày"
        Const.linkTuVi = "http://tracuu.tuvisomenh.com/xem-lich/lich-am-duong"
        show()
    }
    
    func show(){
        let chitiettuvi = storyboard?.instantiateViewController(withIdentifier: "chitiettuvi")
        self.present(chitiettuvi!, animated: true, completion: nil)
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
        initTap()
        if(self.view.frame.height<700){
            stack1.spacing = (30 as CGFloat).dp
            stack2.spacing = (30 as CGFloat).dp
            stack3.spacing = (30 as CGFloat).dp

        }else{
            stack1.spacing = (50 as CGFloat).dp
            stack2.spacing = (50 as CGFloat).dp
            stack3.spacing = (50 as CGFloat).dp

        }
        bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait
)
        
        addBannerViewToView(bannerView)
        bannerView.adUnitID = Const.bannerId
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        interstitial = createAndLoadInterstitial()

        // Do any additional setup after loading the view.
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
