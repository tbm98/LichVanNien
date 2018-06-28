//
//  ChiTiet1PageViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class SubPage:  UIPageViewController ,
    UIPageViewControllerDelegate,
UIPageViewControllerDataSource{
    
    
    var ngay = 0
    var date:Date?
    let calendar = Calendar.current
    var pageFinish:PageFinish?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        setViewControllers([viewPage(for: date!)!], direction: .forward, animated: true, completion: nil)
       
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
        return 3
    }
    
    func viewPage(for date: Date) -> ViewLich? {
        guard let viewPage = storyboard?.instantiateViewController(withIdentifier: "viewlich") as? ViewLich else {
            return nil
        }
        
        viewPage.date = date
        viewPage.pageFinish = self.pageFinish
        viewPage.indexBG = Const.randomInt(min: 0, max: Const.imageBackgrounds.count - 1)
        viewPage.indexCN = Const.randomInt(min: 0, max: Const.chamNgon.count - 1)
        return viewPage
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        debugPrint("Before: ", separator: "", terminator: "")
        let today = (viewController as! ViewLich).date
        guard var yesterday = calendar.date(byAdding: .day, value: -1, to: today!) else {
            return nil
        }
        yesterday = calendar.startOfDay(for: yesterday)
        
        return viewPage(for: yesterday)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        debugPrint("After: ", separator: "", terminator: "")
        let today = (viewController as! ViewLich).date
        guard var tomorrow = calendar.date(byAdding: .day, value: 1, to: today!) else {
            return nil
        }
        tomorrow = calendar.startOfDay(for: tomorrow)
        
        return viewPage(for: tomorrow)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if(completed){
            print("conpleted2")
            self.date = (self.viewControllers?.first as! ViewLich).date!
            DispatchQueue.main.async {
                Const.update = false
                self.pageFinish?.updateUI(date: self.date!)
            }
        }
    }
  
}
