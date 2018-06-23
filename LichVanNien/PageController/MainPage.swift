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
UIPageViewControllerDataSource, PageFinish, ChucNangTren, ChucNangDuoi{
    func chiTiet() {
        let thoitiet:UIViewController = (storyboard?.instantiateViewController(withIdentifier: "chitiet"))!
        self.present(thoitiet, animated: true, completion: nil)
    }
    
    func lichThang() {
        let thoitiet:UIViewController = (storyboard?.instantiateViewController(withIdentifier: "lichthang"))!
        self.present(thoitiet, animated: true, completion: nil)
    }
    
    func doiNgay() {
        //
    }
    
    func nhieuHon() {
        let thoitiet:UIViewController = (storyboard?.instantiateViewController(withIdentifier: "nhieuhon"))!
        self.present(thoitiet, animated: true, completion: nil)
    }
    
    
    var addedChucNang = false
    
    
    func thoiTiet() {
        let thoitiet:UIViewController = (storyboard?.instantiateViewController(withIdentifier: "thoitiet"))!
        self.present(thoitiet, animated: true, completion: nil)
    }
    
    func homNay() {
        self.date = Date()
        setViewControllers([viewPage(for: Date())!], direction: .forward, animated: true, completion: nil)
    }
    
    func chonThang() {
        //
    }
    
    func share() {
        //
    }
    
    func lichCaNhan() {
        let lichcanhan:UIViewController = (storyboard?.instantiateViewController(withIdentifier: "lichcanhan"))!
        self.present(lichcanhan, animated: true, completion: nil)
    }
    

    

    
    var thang = 0
    var chucNangTren:Tren? = nil
    var chucNangDuoi:Duoi? = nil

    var date = Date()
    let calendar = Calendar.current
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        setViewControllers([viewPage(for: date)!], direction: .forward, animated: true, completion: nil)
        if(addedChucNang==false){
            addChucNang()
        }
        addedChucNang = true
        
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        upSwipe.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(upSwipe)
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        downSwipe.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(downSwipe)
        //print(Const.chamNgon)
        // Do any additional setup after loading the view.
    }
    
    @objc func swipeAction(swipe:UISwipeGestureRecognizer){
        switch swipe.direction{
        case UISwipeGestureRecognizerDirection.up:
            print("3")
            guard var d = calendar.date(byAdding: .month, value: 1, to: self.date) else {
                return
            }
            d = calendar.startOfDay(for: d)
            self.date = d
            setViewControllers([viewPage(for: d)!], direction: .forward, animated: true, completion: nil)
        case UISwipeGestureRecognizerDirection.down:
            print("4")
            guard var d = calendar.date(byAdding: .month, value: -1, to: self.date) else {
                return
            }
            d = calendar.startOfDay(for: d)
            self.date = d
            setViewControllers([viewPage(for: d)!], direction: .reverse, animated: true, completion: nil)
        default:
            break
        }
    }
    


    
    func updateUI(date:Date) {
        print("update UI")
        updateChucNang(date: date)
    }
    
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }

    
    func addChucNang(){
        chucNangTren = storyboard!.instantiateViewController(withIdentifier: "tren") as! Tren
        chucNangTren?.date = self.date
        chucNangTren?.chucNang = self
        
        self.addChildViewController(chucNangTren!)
        var fra = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
        chucNangTren?.view.frame = fra// or better, turn off `translatesAutoresizingMaskIntoConstraints` and then define constraints for this subview
        self.view.addSubview((chucNangTren?.view)!)
        chucNangTren?.didMove(toParentViewController: self)
        //duoi
        chucNangDuoi = storyboard!.instantiateViewController(withIdentifier: "duoi") as! Duoi
        chucNangDuoi?.date = self.date
        chucNangDuoi?.chucNang = self
        self.addChildViewController(chucNangDuoi!)
        fra = CGRect(x: 0, y: self.view.frame.height-200, width: self.view.frame.width, height: 200)
        chucNangDuoi?.view.frame = fra// or better, turn off `translatesAutoresizingMaskIntoConstraints` and then define constraints for this subview
        self.view.addSubview((chucNangDuoi?.view)!)
        chucNangDuoi?.didMove(toParentViewController: self)
        //
    }
    
    func updateChucNang(date:Date){
        //chucNangDuoi.labelNgay.text = n
        print("update chuc nang ")
        chucNangDuoi?.updateUI(date: date)
        
    }
    
    
    func viewPage(for date: Date) -> ViewLich? {
        guard let viewPage = storyboard?.instantiateViewController(withIdentifier: "viewlich") as? ViewLich else {
            return nil
        }
        viewPage.date = date
        viewPage.pageFinish = self
        return viewPage
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 2
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        debugPrint("Before: thang", separator: "", terminator: "")
        let today = (viewController as! ViewLich).date
        var components = calendar.dateComponents([.year, .month, .day], from: today!)
        guard var yesterday = calendar.date(byAdding: .day, value: -1, to: today!) else {
            return nil
        }
        yesterday = calendar.startOfDay(for: yesterday)
        return viewPage(for: yesterday)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        debugPrint("After: thang", separator: "", terminator: "")
        let today = (viewController as! ViewLich).date
        var components = calendar.dateComponents([.year, .month, .day], from: today!)
        guard var tomorrow = calendar.date(byAdding: .day, value: 1, to: today!) else {
            return nil
        }
        tomorrow = calendar.startOfDay(for: tomorrow)
        return viewPage(for: tomorrow)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if(completed){
        }
        self.date = (self.viewControllers?.first as! ViewLich).date!
   
    }

}

protocol PageFinish {
    func updateUI(date:Date)
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
