//
//  PageViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit
import GoogleMobileAds


class MainPage: UIPageViewController ,
    UIPageViewControllerDelegate,
UIPageViewControllerDataSource,GADInterstitialDelegate, PageFinish, ChucNangTren, ChucNangDuoi, ChonNgayXong,GADBannerViewDelegate{
    
//    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
//        print("loading error banner")
//        //bannerView.isHidden = true
//        if(self.view.frame.height>800){
//            chucNangDuoi?.view.frame = CGRect(x: 0, y: self.view.frame.height-((190) as CGFloat).dp, width: self.view.frame.width, height: ((190) as CGFloat).dp)
//        }else if(self.view.frame.height>700){
//            chucNangDuoi?.view.frame = CGRect(x: 0, y: self.view.frame.height-((160) as CGFloat).dp, width: self.view.frame.width, height: ((160) as CGFloat).dp)
//        }else{
//            chucNangDuoi?.view.frame = CGRect(x: 0, y: self.view.frame.height-((164) as CGFloat).dp, width: self.view.frame.width, height: ((164) as CGFloat).dp)
//        }
//        chucNangDuoi?.view.removeFromSuperview()
//        //self.view.addSubview((chucNangDuoi?.view)!)
//    }
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        chucNangDuoi?.view.removeFromSuperview()
                if(self.view.frame.height>800){
                    chucNangDuoi?.view.frame = CGRect(x: 0, y: self.view.frame.height-((190+50) as CGFloat).dp, width: self.view.frame.width, height: ((190+50) as CGFloat).dp)
                }else if(self.view.frame.height>700){
                    chucNangDuoi?.view.frame = CGRect(x: 0, y: self.view.frame.height-((160+50) as CGFloat).dp, width: self.view.frame.width, height: ((160+50) as CGFloat).dp)
                }else{
                    chucNangDuoi?.view.frame = CGRect(x: 0, y: self.view.frame.height-((164+50) as CGFloat).dp, width: self.view.frame.width, height: ((164+50) as CGFloat).dp)
                }
                //chucNangDuoi?.view.removeFromSuperview()
        self.view.addSubview((chucNangDuoi?.view)!)
        (self.viewControllers?.first as! SubPage).updateUI()
        
    }
    
    
    func done(date:Date) {
        updateUI(date: date)
        chonThang()
    }
    
    var mode = 1

    func chiTiet() {
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
        let chitiet:ChiTiet = (storyboard?.instantiateViewController(withIdentifier: "chitiet"))! as! ChiTiet
        chitiet.date = self.date
        self.present(chitiet, animated: true, completion: nil)
    }
    
    func lichThang() {
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
        let lichthang:UIViewController = (storyboard?.instantiateViewController(withIdentifier: "lichthang"))!
        self.present(lichthang, animated: true, completion: nil)
    }
    
    func doiNgay() {
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
        let doingay:UIViewController = (storyboard?.instantiateViewController(withIdentifier: "doingay"))!
        self.present(doingay, animated: true, completion: nil)
    }
    
    func nhieuHon() {
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
        let nhieuhon:UIViewController = (storyboard?.instantiateViewController(withIdentifier: "nhieuhon"))!
        self.present(nhieuhon, animated: true, completion: nil)
    }
    
    func thoiTiet() {
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
        let thoitiet:UIViewController = (storyboard?.instantiateViewController(withIdentifier: "thoitiet"))!
        self.present(thoitiet, animated: true, completion: nil)
    }
    
    func homNay() {
        self.date = Date()
        updateChucNang(date: date)
        setViewControllers([viewPage(for: Date())!], direction: .forward, animated: true, completion: nil)
    }
    var a = false
    func chonThang() {
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
        if(a){
            chonNgay?.view.removeFromSuperview()
        }else{
            self.view.addSubview((chonNgay?.view)!)
        }
        a = !a
    }
    
    func share() {
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
        let image:[Any] = [UIApplication.shared.screenShot as Any]
        let activityVC = UIActivityViewController(activityItems: image, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }

    func lichCaNhan() {
        Const.countAction = Const.countAction + 1
        mode = 8
        if(Const.countAction >= 5 && (Date().millisecondsSince1970 - Const.timeRepeat > 180000)){
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
                Const.countAction = 0
                Const.timeRepeat = Date().millisecondsSince1970
            } else {
                print("Ad wasn't ready")
                mode8()
            }
            
        }else{
            mode8()
        }
    }
    func mode8(){
        let lichcanhan:UIViewController = (storyboard?.instantiateViewController(withIdentifier: "lichcanhan"))!
        self.present(lichcanhan, animated: true, completion: nil)
    }
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
        case 8:
        mode8()
        default:
            break
        }
    }
    
    var thang = 0
    var chucNangTren:Tren? = nil
    var chucNangDuoi:Duoi? = nil
    var chonNgay:ChonNgay? = nil

    var date = Date()
    let calendar = Calendar.current
    var appear = false
    
    var interstitial: GADInterstitial!
    var bannerView: GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        Const.date = self.date
        setViewControllers([viewPage(for: date)!], direction: .forward, animated: true, completion: nil)
        addChucNang()
        print("width:",self.view.frame.width)
        print("height:",self.view.frame.height)
        interstitial = createAndLoadInterstitial()
        bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait
        )
        
        addBannerViewToView(bannerView)
        bannerView.adUnitID = Const.bannerId
        bannerView.rootViewController = self
        bannerView.delegate = self
        bannerView.load(GADRequest())
        //interstitial = GADInterstitial(adUnitID: Const.interstitialId)
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
    func createAndLoadInterstitial() -> GADInterstitial {
        var interstitial = GADInterstitial(adUnitID: Const.interstitialId)
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    

    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
        if(appear){
            print("view will appear2")
            updateUI(date: Const.date!)
        }
        appear = true
        
    }
    
    func updateUI(date:Date) {
        print("update UI")
        Const.date = self.date
        updateChucNang(date: date)
    }
    
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .vertical, options: nil)
    }

    func addChucNang(){
        chucNangTren = storyboard!.instantiateViewController(withIdentifier: "chucnangtren") as? Tren
        chucNangTren?.date = self.date
        chucNangTren?.chucNang = self
        self.addChildViewController(chucNangTren!)
        var fra:CGRect
        if(self.view.frame.height>800){
            fra = CGRect(x: 0, y: 20, width: self.view.frame.width, height: 50)
        }else{
            fra = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
        }
        
        chucNangTren?.view.frame = fra// or better, turn off `translatesAutoresizingMaskIntoConstraints` and then define constraints for this subview
        self.view.addSubview((chucNangTren?.view)!)
        chucNangTren?.didMove(toParentViewController: self)
        //duoi
        chucNangDuoi = storyboard!.instantiateViewController(withIdentifier: "chucnangduoi") as? Duoi
        chucNangDuoi?.date = self.date
        chucNangDuoi?.chucNang = self
        
        self.addChildViewController(chucNangDuoi!)
        if(self.view.frame.height>800){
            fra = CGRect(x: 0, y: self.view.frame.height-((190) as CGFloat).dp, width: self.view.frame.width, height: ((190) as CGFloat).dp)
        }else if(self.view.frame.height>700){
            fra = CGRect(x: 0, y: self.view.frame.height-((160) as CGFloat).dp, width: self.view.frame.width, height: ((160) as CGFloat).dp)
        }else{
            fra = CGRect(x: 0, y: self.view.frame.height-((164) as CGFloat).dp, width: self.view.frame.width, height: ((164) as CGFloat).dp)
        }
//        if(Net.isConnectedToNetwork()){
//            if(self.view.frame.height>800){
//                fra = CGRect(x: 0, y: self.view.frame.height-((190+50) as CGFloat).dp, width: self.view.frame.width, height: ((190+50) as CGFloat).dp)
//            }else if(self.view.frame.height>700){
//                fra = CGRect(x: 0, y: self.view.frame.height-((160+50) as CGFloat).dp, width: self.view.frame.width, height: ((160+50) as CGFloat).dp)
//            }else{
//                fra = CGRect(x: 0, y: self.view.frame.height-((164+50) as CGFloat).dp, width: self.view.frame.width, height: ((164+50) as CGFloat).dp)
//            }
//        }else{
//            if(self.view.frame.height>800){
//                fra = CGRect(x: 0, y: self.view.frame.height-((190) as CGFloat).dp, width: self.view.frame.width, height: ((190) as CGFloat).dp)
//            }else if(self.view.frame.height>700){
//                fra = CGRect(x: 0, y: self.view.frame.height-((160) as CGFloat).dp, width: self.view.frame.width, height: ((160) as CGFloat).dp)
//            }else{
//                fra = CGRect(x: 0, y: self.view.frame.height-((164) as CGFloat).dp, width: self.view.frame.width, height: ((164) as CGFloat).dp)
//            }
//        }

        
        chucNangDuoi?.view.frame = fra// or better, turn off `translatesAutoresizingMaskIntoConstraints` and then define constraints for this subview
        self.view.addSubview((chucNangDuoi?.view)!)
        chucNangDuoi?.didMove(toParentViewController: self)

        //chon ngay
        chonNgay = storyboard!.instantiateViewController(withIdentifier: "chonngay") as? ChonNgay
        chonNgay?.dele = self
        
        self.addChildViewController(chonNgay!)
        fra = CGRect(x: 0, y: self.view.frame.height/2 - (145 as CGFloat), width: self.view.frame.width, height: (290 as CGFloat))
        chonNgay?.view.frame = fra// or better, turn off `translatesAutoresizingMaskIntoConstraints` and then define constraints for this subview
        //self.view.addSubview((chonNgay?.view)!)
        chonNgay?.didMove(toParentViewController: self)
    }
    
    func updateChucNang(date:Date){
        chucNangTren?.updateUI(date:date)
        chucNangDuoi?.updateUI(date: date)
        print("update-----------------")
        self.setViewControllers([viewPage(for: date)!], direction: .forward, animated: false, completion: nil)
        self.date = date
        Const.date = date
        Const.indexBackground = Const.randomInt(min: 0, max: Const.imageBackgrounds.count - 1)
        Const.indexChamNgon = Const.randomInt(min: 0, max: Const.chamNgon.count - 1)
    }
    
    
    
    func viewPage(for date: Date) -> SubPage? {
        guard let viewPage = storyboard?.instantiateViewController(withIdentifier: "subpage") as? SubPage else {
            return nil
        }
        viewPage.date = date
        viewPage.pageFinish = self
        return viewPage
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        debugPrint("Before: ", separator: "", terminator: "")
        let today = (viewController as! SubPage).date
        guard var yesterday = calendar.date(byAdding: .month, value: -1, to: today!) else {
            return nil
        }
        yesterday = calendar.startOfDay(for: yesterday)
        return viewPage(for: yesterday)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        debugPrint("After: ", separator: "", terminator: "")
        let today = (viewController as! SubPage).date
        guard var tomorrow = calendar.date(byAdding: .month, value: 1, to: today!) else {
            return nil
        }
        tomorrow = calendar.startOfDay(for: tomorrow)
        return viewPage(for: tomorrow)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if(completed){
            print("conpleted1")
            self.date = (self.viewControllers?.first as! SubPage).date!
            DispatchQueue.main.async {
                Const.update = false
                self.updateUI(date: self.date)
            }
        }
    }
}

protocol PageFinish {
    func updateUI(date:Date)
}
protocol ChonNgayXong{
    func done(date:Date)
}
protocol ChucNangTren {
    func thoiTiet()
    func homNay()
    func chonThang()
    func share()
    func lichCaNhan()
}
protocol ChucNangDuoi {
    func chiTiet()
    func lichThang()
    func doiNgay()
    func nhieuHon()
}
