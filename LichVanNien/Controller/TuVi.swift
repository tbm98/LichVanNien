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
    @IBAction func btnShare(_ sender: Any) {
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
    @IBOutlet weak var viewHomNay: UIView!
    @IBOutlet weak var viewGioTot: UIView!
    @IBOutlet weak var viewNgayTot: UIView!
    @IBOutlet weak var viewAmDuong: UIView!
    
    
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
        if interstitial.isReady && Const.countAction >= 5{
            interstitial.present(fromRootViewController: self)
            Const.countAction = 0
        }
        Const.titleTuVi = "Tử Vi Hôm Nay"
        Const.linkTuVi = "http://tracuu.tuvisomenh.com/xem-ngay-tot-xau"
        show()
        
    }
    @objc func actionGioTot(tapGestureRecognizer: UITapGestureRecognizer) {
        print("gt")
        Const.countAction = Const.countAction + 1
        if interstitial.isReady && Const.countAction >= 5{
            interstitial.present(fromRootViewController: self)
            Const.countAction = 0
        }
        Const.titleTuVi = "Giờ Tốt Hôm Nay"
        Const.linkTuVi = "http://tracuu.tuvisomenh.com/xem-ngay-tot-xau/xem-gio-tot-trong-ngay"
        show()
    }
    @objc func actionNgayTot(tapGestureRecognizer: UITapGestureRecognizer) {
        Const.countAction = Const.countAction + 1
        if interstitial.isReady && Const.countAction >= 5{
            interstitial.present(fromRootViewController: self)
            Const.countAction = 0
        }
        Const.titleTuVi = "Ngày Tốt Trong Tháng"
        Const.linkTuVi = "http://tracuu.tuvisomenh.com/xem-ngay-tot-xau/xem-ngay-tot-xau-trong-thang"
        show()
    }
    @objc func actionAmDuong(tapGestureRecognizer: UITapGestureRecognizer) {
        Const.countAction = Const.countAction + 1
        if interstitial.isReady && Const.countAction >= 5{
            interstitial.present(fromRootViewController: self)
            Const.countAction = 0
        }
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
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        
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
