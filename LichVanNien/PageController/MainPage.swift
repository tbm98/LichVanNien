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
UIPageViewControllerDataSource, PageFinish, ChucNangTren, ChucNangDuoi, ChonNgayXong{
    
    func done(date:Date) {
        updateUI(date: date)
        chonThang()
    }

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
        updateChucNang(date: date)
        setViewControllers([viewPage(for: Date())!], direction: .forward, animated: true, completion: nil)
    }
    var a = false
    func chonThang() {
        //
        print("chon thang")
        if(a){
            chonNgay?.view.removeFromSuperview()
        }else{
            self.view.addSubview((chonNgay?.view)!)
        }
        a = !a
        
    }
    
    func share() {
        let image:[Any] = [UIApplication.shared.screenShot as Any]
        let activityVC = UIActivityViewController(activityItems: image, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
    /// Takes the screenshot of the screen and returns the corresponding image
    ///
    /// - Parameter shouldSave: Boolean flag asking if the image needs to be saved to user's photo library. Default set to 'true'
    /// - Returns: (Optional)image captured as a screenshot
    open func takeScreenshot(_ shouldSave: Bool = true) -> UIImage? {
        var screenshotImage :UIImage?
        let layer = UIApplication.shared.keyWindow!.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
        guard let context = UIGraphicsGetCurrentContext() else {return nil}
        layer.render(in:context)
        screenshotImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let image = screenshotImage, shouldSave {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
        return screenshotImage
    }
    
    func lichCaNhan() {
        let lichcanhan:UIViewController = (storyboard?.instantiateViewController(withIdentifier: "lichcanhan"))!
        self.present(lichcanhan, animated: true, completion: nil)
    }
    

    
    var thang = 0
    var chucNangTren:Tren? = nil
    var chucNangDuoi:Duoi? = nil
    var chonNgay:ChonNgay? = nil

    var date = Date()
    let calendar = Calendar.current
    var appear = false
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        Const.date = self.date
        setViewControllers([viewPage(for: date)!], direction: .forward, animated: true, completion: nil)
        addChucNang()
//        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
//        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
//        self.view.addGestureRecognizer(leftSwipe)
        // Do any additional setup after loading the view.
        print("width:",self.view.frame.width)
        print("height:",self.view.frame.height)
    }
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
        if(appear){
            print("view will appear2")
            updateUI(date: Const.date!)
        }
        appear = true
        
    }
    
    func updateUI(date:Date) {
        print("update UI")
        Const.date = self.date
        updateChucNang(date: date)
    }
    
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .vertical, options: nil)
    }

    
    func addChucNang(){
        chucNangTren = storyboard!.instantiateViewController(withIdentifier: "chucnangtren") as? Tren
        chucNangTren?.date = self.date
        chucNangTren?.chucNang = self
        
        
        self.addChildViewController(chucNangTren!)
        var fra = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
        chucNangTren?.view.frame = fra// or better, turn off `translatesAutoresizingMaskIntoConstraints` and then define constraints for this subview
        self.view.addSubview((chucNangTren?.view)!)
        chucNangTren?.didMove(toParentViewController: self)
        //duoi
        chucNangDuoi = storyboard!.instantiateViewController(withIdentifier: "chucnangduoi") as? Duoi
        chucNangDuoi?.date = self.date
        chucNangDuoi?.chucNang = self
        
        self.addChildViewController(chucNangDuoi!)
        fra = CGRect(x: 0, y: self.view.frame.height-(164 as CGFloat).dp, width: self.view.frame.width, height: (164 as CGFloat).dp)
        chucNangDuoi?.view.frame = fra// or better, turn off `translatesAutoresizingMaskIntoConstraints` and then define constraints for this subview
        self.view.addSubview((chucNangDuoi?.view)!)
        chucNangDuoi?.didMove(toParentViewController: self)
        
        
        //chon ngay
        chonNgay = storyboard!.instantiateViewController(withIdentifier: "chonngay") as? ChonNgay
//        chonNgay?.date = self.date
//        chonNgay?.chucNang = self
        chonNgay?.dele = self
        
        self.addChildViewController(chonNgay!)
        fra = CGRect(x: 0, y: self.view.frame.height/2 - (145 as CGFloat), width: self.view.frame.width, height: (290 as CGFloat))
        chonNgay?.view.frame = fra// or better, turn off `translatesAutoresizingMaskIntoConstraints` and then define constraints for this subview
        //self.view.addSubview((chonNgay?.view)!)
        chonNgay?.didMove(toParentViewController: self)
    }
    
    func updateChucNang(date:Date){
        //chucNangDuoi.labelNgay.text = n
        print("update chuc nang ")
        chucNangTren?.updateUI(date:date)
        chucNangDuoi?.updateUI(date: date)
        print("update-----------------")
        let p1 = calendar.dateComponents([.year, .month, .day], from: self.date)
        let p2 = calendar.dateComponents([.year, .month, .day], from: date)
        if(p1.year != p2.year || p1.month != p2.month || p1.day != p2.day){
            print("self.datem",self.date)
            print("datem",date)
            
            self.setViewControllers([viewPage(for: date)!], direction: .forward, animated: false, completion: nil)
            self.date = date
            Const.date = date
        }
        Const.indexBackground2 = Const.randomInt(min: 0, max: Const.imageBackgrounds.count - 1)
        Const.indexChamNgon2 = Const.randomInt(min: 0, max: Const.chamNgon.count - 1)
        

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
        let p1 = calendar.dateComponents([.year, .month, .day], from: self.date)
        let p2 = calendar.dateComponents([.year, .month, .day], from: Const.date!)
        if(p1.year != p2.year || p1.month != p2.month || p1.day != p2.day){
            DispatchQueue.main.async {
                self.updateUI(date: self.date)
            }
        }
        

        
    }

    

}

protocol PageFinish {
    func updateUI(date:Date)
}
protocol ChonNgayXong{
    func done(date:Date)
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
