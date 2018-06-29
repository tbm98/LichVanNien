//
//  SubPageLichThang.swift
//  LichVanNien
//
//  Created by TBM on 6/29/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class SubPageLichThang: UIPageViewController ,
    UIPageViewControllerDelegate,
UIPageViewControllerDataSource{

    var date:Date?
    var dele:viewlich?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        setViewControllers([viewPage(for: self.date!)!], direction: .forward, animated: true, completion: nil)
        // Do any additional setup after loading the view.
    }
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    func viewPage(for date: Date) -> ViewLichThang? {
        guard let viewPage = storyboard?.instantiateViewController(withIdentifier: "viewlichthang") as? ViewLichThang else {
            return nil
        }
        
        viewPage.date = date
        viewPage.dele = self.dele
//        viewPage.indexBG = Const.randomInt(min: 0, max: Const.imageBackgrounds.count - 1)
//        viewPage.indexCN = Const.randomInt(min: 0, max: Const.chamNgon.count - 1)
        return viewPage
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        debugPrint("Before: ", separator: "", terminator: "")
        let today = (viewController as! ViewLichThang).date
        guard var yesterday = calendar.date(byAdding: .month, value: -1, to: today!) else {
            return nil
        }
        yesterday = calendar.startOfDay(for: yesterday)
        
        return viewPage(for: yesterday)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        debugPrint("After: ", separator: "", terminator: "")
        let today = (viewController as! ViewLichThang).date
        guard var tomorrow = calendar.date(byAdding: .month, value: 1, to: today!) else {
            return nil
        }
        tomorrow = calendar.startOfDay(for: tomorrow)
        
        return viewPage(for: tomorrow)
    }


}
