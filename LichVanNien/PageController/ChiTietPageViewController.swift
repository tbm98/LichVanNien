//
//  PageViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class ChiTietPageViewController: UIPageViewController ,
    UIPageViewControllerDelegate,
UIPageViewControllerDataSource{

    
    var currentIndex = 0
    lazy var subViewController:[UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "p1") as! ChiTiet1PageViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "p2") as! ChiTiet2PageViewController
        ]
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        setViewControllers([subViewController[0]], direction: .forward, animated: true, completion: nil)
        addChucNang()
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(leftSwipe)
        // Do any additional setup after loading the view.
    }
    
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .vertical, options: nil)
    }

    
    func addChucNang(){
        var controller = storyboard!.instantiateViewController(withIdentifier: "chucNangTren")
        self.addChildViewController(controller)
        var fra = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
        controller.view.frame = fra// or better, turn off `translatesAutoresizingMaskIntoConstraints` and then define constraints for this subview
        self.view.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
        //duoi
        controller = storyboard!.instantiateViewController(withIdentifier: "chucNangDuoi")
        self.addChildViewController(controller)
        fra = CGRect(x: 0, y: self.view.frame.height-200, width: self.view.frame.width, height: 200)
        controller.view.frame = fra// or better, turn off `translatesAutoresizingMaskIntoConstraints` and then define constraints for this subview
        self.view.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
        //
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewController.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        currentIndex = subViewController.index(of: viewController) ?? 0
        print("giam thang")
        if(currentIndex <= 0){
            return subViewController[subViewController.count-1]
        }
        return subViewController[currentIndex-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        currentIndex = subViewController.index(of: viewController) ?? 0
        print("tang thang")
        if(currentIndex >= subViewController.count-1){
            return subViewController[0]
        }
        return subViewController[currentIndex+1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print("conpleted1")
        print("current:",currentIndex)
        //addChucNang()
        
    }
    

}
