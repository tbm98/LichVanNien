//
//  PageViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class MainPageViewController: UIPageViewController ,
    UIPageViewControllerDelegate,
UIPageViewControllerDataSource{

    
    var thang = 0
    var chucNangTren:ChucNangTrenViewController? = nil
    var chucNangDuoi:ChucNangDuoiViewController? = nil
    lazy var subViewController:[UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "p") as! ChiTietPageViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "p") as! ChiTietPageViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "p") as! ChiTietPageViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "p") as! ChiTietPageViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "p") as! ChiTietPageViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "p") as! ChiTietPageViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "p") as! ChiTietPageViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "p") as! ChiTietPageViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "p") as! ChiTietPageViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "p") as! ChiTietPageViewController
        ]
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        setViewControllers([subViewController[4]], direction: .forward, animated: true, completion: nil)
        addChucNang()
//        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
//        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
//        self.view.addGestureRecognizer(leftSwipe)
        // Do any additional setup after loading the view.
    }
    
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .vertical, options: nil)
    }

    
    func addChucNang(){
        chucNangTren = storyboard!.instantiateViewController(withIdentifier: "chucNangTren") as! ChucNangTrenViewController
        self.addChildViewController(chucNangTren!)
        var fra = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
        chucNangTren?.view.frame = fra// or better, turn off `translatesAutoresizingMaskIntoConstraints` and then define constraints for this subview
        self.view.addSubview((chucNangTren?.view)!)
        chucNangTren?.didMove(toParentViewController: self)
        //duoi
        chucNangDuoi = storyboard!.instantiateViewController(withIdentifier: "chucNangDuoi") as! ChucNangDuoiViewController
        self.addChildViewController(chucNangDuoi!)
        fra = CGRect(x: 0, y: self.view.frame.height-200, width: self.view.frame.width, height: 200)
        chucNangDuoi?.view.frame = fra// or better, turn off `translatesAutoresizingMaskIntoConstraints` and then define constraints for this subview
        self.view.addSubview((chucNangDuoi?.view)!)
        chucNangDuoi?.didMove(toParentViewController: self)
        //
    }
    
    func updateChucNang(){
        //chucNangDuoi.labelNgay.text = n
        print("update chuc nang ")
        chucNangDuoi?.labelThang.text = "\(thang)"
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewController.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        thang = subViewController.index(of: viewController) ?? 0
        print("state: giam thang")
        if(thang <= 0){
            return subViewController[subViewController.count-1]
        }
        return subViewController[thang-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        thang = subViewController.index(of: viewController) ?? 0
        print("state: tang thang")
        if(thang >= subViewController.count-1){
            return subViewController[0]
        }
        return subViewController[thang+1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if(completed){
            print("conpleted1")
            print("Thang:",thang)
            //addChucNang()
            updateChucNang()
        }
     
        
    }

    

}
