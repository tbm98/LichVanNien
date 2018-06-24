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
        setViewControllers([viewPage(for: date)!], direction: .forward, animated: true, completion: nil)
        addChucNang()
//        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
//        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
//        self.view.addGestureRecognizer(leftSwipe)
        // Do any additional setup after loading the view.
    }
    
    func updateUI(date:Date) {
        print("update UI")
        updateChucNang(date: date)
    }
    
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .vertical, options: nil)
    }

    
    func addChucNang(){
        chucNangTren = storyboard!.instantiateViewController(withIdentifier: "chucnangtren") as! Tren
        chucNangTren?.date = self.date
        chucNangTren?.chucNang = self
        
        self.addChildViewController(chucNangTren!)
        var fra = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
        chucNangTren?.view.frame = fra// or better, turn off `translatesAutoresizingMaskIntoConstraints` and then define constraints for this subview
        self.view.addSubview((chucNangTren?.view)!)
        chucNangTren?.didMove(toParentViewController: self)
        //duoi
        chucNangDuoi = storyboard!.instantiateViewController(withIdentifier: "chucnangduoi") as! Duoi
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
        print("update-----------------")
        self.setViewControllers([viewPage(for: date)!], direction: .forward, animated: false, completion: nil)
        Const.indexBackground = Const.randomInt(min: 0, max: Const.imageBackgrounds.count - 1)
        Const.indexChamNgon = Const.randomInt(min: 0, max: Const.chamNgon.count - 1)
    }
    
//    func updateChucNang(date:Date){
//        //chucNangDuoi.labelNgay.text = n
//        print("update chuc nang ")
//        let components = calendar.dateComponents([.year, .month, .day], from: date)
//        chucNangDuoi?.labelThang.text = components.month?.description
//        chucNangDuoi?.labelNgay.text = components.day?.description
//        //if(Const.update > 2){
//            print("update-----------------")
//            self.setViewControllers([viewPage(for: date)!], direction: .forward, animated: false, completion: nil)
//        Const.index = Const.index + 1
//        if(Const.index > 14){
//            Const.index = 0
//        }
//        //}
//    }
    
    
    func viewPage(for date: Date) -> SubPage? {
        // Create a new view controller and pass suitable data.
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
//        thang = subViewController.index(of: viewController) ?? 0
//        print("state: giam thang")
//        if(thang <= 0){
//            return subViewController[subViewController.count-1]
//        }
//        return subViewController[thang-1]
        debugPrint("Before: ", separator: "", terminator: "")
        let today = (viewController as! SubPage).date
        guard var yesterday = calendar.date(byAdding: .month, value: -1, to: today!) else {
            return nil
        }
        yesterday = calendar.startOfDay(for: yesterday)
        
        return viewPage(for: yesterday)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        thang = subViewController.index(of: viewController) ?? 0
//        print("state: tang thang")
//        if(thang >= subViewController.count-1){
//            return subViewController[0]
//        }
//        return subViewController[thang+1]
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
            print("Thang:",thang)
            //addChucNang()
            //updateChucNang()
        }
        self.date = (self.viewControllers?.first as! SubPage).date!
        DispatchQueue.main.async {
            self.updateUI(date: self.date)
        }
        

        
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
