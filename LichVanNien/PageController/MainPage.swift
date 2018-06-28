//
//  PageViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class MainPage: UIPageViewController ,
    UIPageViewControllerDelegate,
UIPageViewControllerDataSource, PageFinish, ChucNangTren, ChucNangDuoi, ChonNgayXong{
    
    func done(date:Date) {
        updateUI(date: date)
        chonThang()
    }

    func chiTiet() {
        let chitiet:ChiTiet = (storyboard?.instantiateViewController(withIdentifier: "chitiet"))! as! ChiTiet
        chitiet.date = self.date
        self.present(chitiet, animated: true, completion: nil)
    }
    
    func lichThang() {
        let lichthang:UIViewController = (storyboard?.instantiateViewController(withIdentifier: "lichthang"))!
        self.present(lichthang, animated: true, completion: nil)
    }
    
    func doiNgay() {
        let doingay:UIViewController = (storyboard?.instantiateViewController(withIdentifier: "doingay"))!
        self.present(doingay, animated: true, completion: nil)
    }
    
    func nhieuHon() {
        let nhieuhon:UIViewController = (storyboard?.instantiateViewController(withIdentifier: "nhieuhon"))!
        self.present(nhieuhon, animated: true, completion: nil)
    }
    
    func thoiTiet() {
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
        print("chon thang")
        if(a){
            chonNgay?.view.removeFromSuperview()
        }else{
            self.view.addSubview((chonNgay?.view)!)
        }
        a = !a
    }
    
    func share() {
        let image:[Any] = [UIApplication.shared.screenShot as Any]
        let activityVC = UIActivityViewController(activityItems: image, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }

    func lichCaNhan() {
        let lichcanhan:UIViewController = (storyboard?.instantiateViewController(withIdentifier: "lichcanhan"))!
        self.present(lichcanhan, animated: true, completion: nil)
    }
    
    var thang = 0
    var chucNangTren:Tren? = nil
    var chucNangDuoi:Duoi? = nil
    var chonNgay:ChonNgay? = nil

    var date = Date()
    let calendar = Calendar.current
    var appear = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        Const.date = self.date
        setViewControllers([viewPage(for: date)!], direction: .forward, animated: true, completion: nil)
        addChucNang()
        print("width:",self.view.frame.width)
        print("height:",self.view.frame.height)
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
        var fra = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
        chucNangTren?.view.frame = fra// or better, turn off `translatesAutoresizingMaskIntoConstraints` and then define constraints for this subview
        self.view.addSubview((chucNangTren?.view)!)
        chucNangTren?.didMove(toParentViewController: self)
        //duoi
        chucNangDuoi = storyboard!.instantiateViewController(withIdentifier: "chucnangduoi") as? Duoi
        chucNangDuoi?.date = self.date
        chucNangDuoi?.chucNang = self
        
        self.addChildViewController(chucNangDuoi!)
        fra = CGRect(x: 0, y: self.view.frame.height-(164 as CGFloat).dp, width: self.view.frame.width, height: (164 as CGFloat).dp)
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
