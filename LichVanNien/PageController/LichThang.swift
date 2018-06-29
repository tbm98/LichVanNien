//
//  SecondViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class LichThang: UIPageViewController ,
    UIPageViewControllerDelegate,
UIPageViewControllerDataSource{

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        setViewControllers([viewPage(for: date)!], direction: .forward, animated: true, completion: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .vertical, options: nil)
    }
    func viewPage(for date: Date) -> SubPageLichThang? {
        guard let viewPage = storyboard?.instantiateViewController(withIdentifier: "subpagelichthang") as? SubPageLichThang else {
            return nil
        }
        viewPage.date = date
//        viewPage.pageFinish = self
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

}

