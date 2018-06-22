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
    lazy var subViewController:[UIViewController] = {
        return [
            (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet") as! ChiTietViewController),
            (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet") as! ChiTietViewController),
            (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet") as! ChiTietViewController),
            (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet") as! ChiTietViewController),
            (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet") as! ChiTietViewController),
            (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet") as! ChiTietViewController),
            (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet") as! ChiTietViewController),
            (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet") as! ChiTietViewController),
            (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet") as! ChiTietViewController),
            (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chitiet") as! ChiTietViewController)
        ]
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        setViewControllers([subViewController[4]], direction: .forward, animated: true, completion: nil)
        //addChucNang()
        // Do any additional setup after loading the view.
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
        return subViewController.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        ngay = subViewController.index(of: viewController) ?? 0
        print("state: giam ngay")
        if(ngay <= 0){
            return subViewController[subViewController.count-1]
        }
        return subViewController[ngay-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        ngay = subViewController.index(of: viewController) ?? 0
        print("state: tang ngay")
        if(ngay >= subViewController.count-1){
            return subViewController[0]
        }
        return subViewController[ngay+1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if(completed){
            print("conpleted2")
            print("Ngay:",ngay)
            //addChucNang()
        }
       
        
    }
    
    
}
