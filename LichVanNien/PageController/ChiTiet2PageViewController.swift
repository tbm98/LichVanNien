//
//  ChiTiet2PageViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class ChiTiet2PageViewController:  UIPageViewController ,
    UIPageViewControllerDelegate,
UIPageViewControllerDataSource{
    
    
    var currentIndex = 0
    lazy var subViewController:[UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet1") as! ChiTiet1ViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet2") as! ChiTiet2ViewController
        ]
    }()
    
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        setViewControllers([subViewController[0]], direction: .forward, animated: true, completion: nil)
        //addChucNang()
        // Do any additional setup after loading the view.
    }
    
    func addChucNang(){
        let controller = storyboard!.instantiateViewController(withIdentifier: "chucNang")
        self.addChildViewController(controller)
        controller.view.frame = self.view.frame// or better, turn off `translatesAutoresizingMaskIntoConstraints` and then define constraints for this subview
        self.view.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewController.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        currentIndex = subViewController.index(of: viewController) ?? 0
        if(currentIndex <= 0){
            return subViewController[subViewController.count-1]
        }
        return subViewController[currentIndex-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        currentIndex = subViewController.index(of: viewController) ?? 0
        if(currentIndex >= subViewController.count-1){
            return subViewController[0]
        }
        return subViewController[currentIndex+1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print("conpleted2")
        //addChucNang()
        
    }
    
    
}
