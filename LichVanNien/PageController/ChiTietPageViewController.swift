//
//  ChiTiet1PageViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class ChiTietPageViewController:  UIPageViewController ,
    UIPageViewControllerDelegate,
UIPageViewControllerDataSource{
    
    
    var ngay = 0
    var date:Date?
    let calendar = Calendar.current
    var pageFinish:PageFinish?
    
//    lazy var subViewController:[UIViewController] = {
//        return [
//            (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet") as! ChiTietViewController),
//            (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet") as! ChiTietViewController),
//            (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet") as! ChiTietViewController),
//            (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet") as! ChiTietViewController),
//            (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet") as! ChiTietViewController),
//            (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet") as! ChiTietViewController),
//            (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet") as! ChiTietViewController),
//            (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet") as! ChiTietViewController),
//            (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet") as! ChiTietViewController),
//            (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet") as! ChiTietViewController)
//        ]
//    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        setViewControllers([viewPage(for: date!)!], direction: .forward, animated: true, completion: nil)
        //addChucNang()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //let calendar = Calendar.current
        //let components = calendar.dateComponents([.year, .month, .day], from: date!)
//        print("year:",components.year)
//        print("month:",components.month)
//        print("day:",components.day)
        //self.pageFinish?.updateUI(date: self.date!)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        //setViewControllers([subViewController[0]], direction: .forward, animated: true, completion: nil)

    }
    
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    func addChucNang(){
        let controller = storyboard!.instantiateViewController(withIdentifier: "chucNang")
        self.addChildViewController(controller)
        controller.view.frame = self.view.frame// or better, turn off `translatesAutoresizingMaskIntoConstraints` and then define constraints for this subview
        self.view.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
    }
    
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 2
    }
    
    func viewPage(for date: Date) -> ChiTietViewController? {
        // Create a new view controller and pass suitable data.
        guard let viewPage = storyboard?.instantiateViewController(withIdentifier: "chitiet") as? ChiTietViewController else {
            return nil
        }
        
        viewPage.date = date
        viewPage.pageFinish = self.pageFinish
        return viewPage
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        ngay = subViewController.index(of: viewController) ?? 0
//        print("state: giam ngay")
//        if(ngay <= 0){
//            return subViewController[subViewController.count-1]
//        }
//        return subViewController[ngay-1]
        debugPrint("Before: ", separator: "", terminator: "")
        let today = (viewController as! ChiTietViewController).date
        guard var yesterday = calendar.date(byAdding: .day, value: -1, to: today!) else {
            return nil
        }
        yesterday = calendar.startOfDay(for: yesterday)
        
        return viewPage(for: yesterday)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        ngay = subViewController.index(of: viewController) ?? 0
//        print("state: tang ngay")
//        if(ngay >= subViewController.count-1){
//            return subViewController[0]
//        }
//        return subViewController[ngay+1]
        debugPrint("After: ", separator: "", terminator: "")
        let today = (viewController as! ChiTietViewController).date
        guard var tomorrow = calendar.date(byAdding: .day, value: 1, to: today!) else {
            return nil
        }
        tomorrow = calendar.startOfDay(for: tomorrow)
        
        return viewPage(for: tomorrow)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if(completed){
            print("conpleted2")
            print("Ngay:",ngay)
            //addChucNang()
        }
        self.date = (self.viewControllers?.first as! ChiTietViewController).date!
       
        
    }
    
    
}
