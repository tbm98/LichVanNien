//
//  SecondViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit
import GoogleMobileAds


class LichThang: UIPageViewController ,
    UIPageViewControllerDelegate,
UIPageViewControllerDataSource, navi,viewlich,GADInterstitialDelegate,scroll{

    
    
    
    func choose() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func share() {
        let image:[Any] = [UIApplication.shared.screenShot as Any]
        let activityVC = UIActivityViewController(activityItems: image, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
    func lichcanhan() {
        let lichcanhan:UIViewController = (storyboard?.instantiateViewController(withIdentifier: "lichcanhan"))!
        self.present(lichcanhan, animated: true, completion: nil)
    }
    

    var navi:NaviLich?
    var bannerView: GADBannerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        
        setViewControllers([viewPage(for: date)!], direction: .forward, animated: true, completion: nil)
        addChucNang()
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        
        addBannerViewToView(bannerView)
        bannerView.adUnitID = Const.bannerId
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        // Do any additional setup after loading the view, typically from a nib.
    }
    var interstitial: GADInterstitial!
    override func viewWillAppear(_ animated: Bool) {
        interstitial = createAndLoadInterstitial()
    }
    func createAndLoadInterstitial() -> GADInterstitial {
        var interstitial = GADInterstitial(adUnitID: Const.interstitialId)
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
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
    func addChucNang(){
        //treen
        navi = storyboard!.instantiateViewController(withIdentifier: "navilich") as? NaviLich
        navi?.date = date
        navi?.chucNang = self
        self.addChildViewController(navi!)
        var fra:CGRect
        if(self.view.frame.height>800){
            fra = CGRect(x: 0, y: 40, width: self.view.frame.width, height: 44)
        }else{
            fra = CGRect(x: 0, y: 20, width: self.view.frame.width, height: 44)
        }
        navi?.view.frame = fra// or better, turn off `translatesAutoresizingMaskIntoConstraints` and then define constraints for this subview
        self.view.addSubview((navi?.view)!)
        navi?.didMove(toParentViewController: self)
        
    }
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .vertical, options: nil)
    }
    func viewPage(for date: Date) -> SubPageLichThang? {
        guard let viewPage = storyboard?.instantiateViewController(withIdentifier: "subpagelichthang") as? SubPageLichThang else {
            return nil
        }
        viewPage.date = date
        viewPage.dele = self
        viewPage.finish = self
        return viewPage
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        debugPrint("Before: ", separator: "", terminator: "")
        let today = (viewController as! SubPageLichThang).date
        guard var yesterday = calendar.date(byAdding: .year, value: -1, to: today!) else {
            return nil
        }
        yesterday = calendar.startOfDay(for: yesterday)
        return viewPage(for: yesterday)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        debugPrint("After: ", separator: "", terminator: "")
        let today = (viewController as! SubPageLichThang).date
        guard var tomorrow = calendar.date(byAdding: .year, value: 1, to: today!) else {
            return nil
        }
        tomorrow = calendar.startOfDay(for: tomorrow)
        return viewPage(for: tomorrow)
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if(completed){
            finish()
        }
    }
    func finish() {
        Const.countAction = Const.countAction + 1
        if(Const.countAction >= 5){
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
                Const.countAction = 0
            } else {
                print("Ad wasn't ready")
            }
            
        }
    }

}

protocol navi {
    func back()
    func share()
    func lichcanhan()
}
protocol viewlich {
    func choose()
}
protocol scroll{
    func finish()
}

