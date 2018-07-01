//
//  LichCaNhan.swift
//  LichVanNien
//
//  Created by TBM on 6/24/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit
import CoreData
import GoogleMobileAds


class LichCaNhan: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    
    var appDelegate:AppDelegate?
    
    var context:NSManagedObjectContext?
    var lich:[objectLich] = [
    ]
    
    @IBOutlet weak var btn: UIView!
    @IBOutlet weak var table: UITableView!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lich.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celllichcanhan", for: indexPath) as! LichCaNhanTableViewCell
        let obj = lich[indexPath.row]
        cell.labeltieude.text = obj.tieude
        cell.labelgiothu.text = obj.giothu
        cell.labeldl.text = obj.dl
        cell.labelal.text = obj.al
        cell.labellap.text = obj.lap
        cell.labelluc.text = obj.luc
        cell.labeldiadiem.text = obj.diadiem
        cell.labelghichu.text = obj.ghichu
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Thông báo", message: "Bạn có muốn làm gì?", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Xoá", style: .default) { (action:UIAlertAction) in
            self.deleteAt(id: self.lich[indexPath.row].id)
        }
        let action2 = UIAlertAction(title: "Sửa", style: .default) { (action:UIAlertAction) in
            Const.objLich = self.lich[indexPath.row]
            self.deleteAt(id: self.lich[indexPath.row].id)
            let them = self.storyboard?.instantiateViewController(withIdentifier: "themlich")
            self.present(them!, animated: true, completion: nil)
        }
        let action3 = UIAlertAction(title: "Không", style: .cancel)
        { (action:UIAlertAction) in
                print("khong")
        }
        alertController.addAction(action1)
        alertController.addAction(action2)
        alertController.addAction(action3)
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnShare(_ sender: Any) {
        let image:[Any] = [UIApplication.shared.screenShot as Any]
        let activityVC = UIActivityViewController(activityItems: image, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    fileprivate func rateApp(appId: String) {
        openUrl("itms-apps://itunes.apple.com/us/app/id1253533671")
    }
    fileprivate func openUrl(_ urlString:String) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    @IBAction func btnDanhGia(_ sender: Any) {
        rateApp(appId: "appid")
//        guard let url = URL(string: "itms-apps://itunes.apple.com/app/id1253533671") else {
//            return
//        }
//
//        if #available(iOS 10.0, *) {
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        } else {
//            UIApplication.shared.openURL(url)
//        }
    }
    
    func deleteAt(id:Int){
        
        
        
        let entity = NSEntityDescription.entity(forEntityName: "Lich", in: context!)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)

        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Lich")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context?.fetch(request)

            
            for data in result as! [NSManagedObject] {
                //print(data.value(forKey: "tieude") as! String)
                if(data.value(forKey: "tieude") == nil){
                    continue
                }
                if(data.value(forKey: "id") as! Int == id){
                    context?.delete(data)
                }
            }
            
            
        } catch {
            
            print("Failed")
        }
        do {
            
            try context?.save()
            //table.reloadData()
            loadTable()
            
        } catch {
            
            print("Failed saving")
        }
    }
    
var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.isUserInteractionEnabled = true
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(actionThem(tapGestureRecognizer:)))
        btn.addGestureRecognizer(tapGesture1)
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate?.persistentContainer.viewContext
       
        loadTable()
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        
        addBannerViewToView(bannerView)
        bannerView.adUnitID = Const.bannerId
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        // Do any additional setup after loading the view.
    }
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
    
    func loadTable(){

        
        let entity = NSEntityDescription.entity(forEntityName: "Lich", in: context!)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)

        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Lich")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        
        var tieude:String
        var giothu:String
        var al:String
        var dl:String
        var lap:String
        var luc:String
        var diadiem:String
        var ghichu:String
        var id:Int
        var time:Date
        
        do {
            let result = try context?.fetch(request)
            Const.id = (result?.count)! + 1
            lich.removeAll()
            
            for data in result as! [NSManagedObject] {
                //print(data.value(forKey: "tieude") as! String)
                if(data.value(forKey: "tieude") == nil){
                    continue
                }
                tieude = data.value(forKey: "tieude") as! String
                giothu = data.value(forKey: "giothu") as! String
                al = data.value(forKey: "al") as! String
                dl = data.value(forKey: "dl") as! String
                lap = data.value(forKey: "lap") as! String
                luc = data.value(forKey: "luc") as! String
                diadiem = "\(data.value(forKey: "diadiem") as! String)"
                ghichu = "\(data.value(forKey: "ghichu") as! String)"
                id = data.value(forKey: "id") as! Int
                time = data.value(forKey: "time") as! Date
                
                let notification = UILocalNotification()
                notification.alertTitle = "Thông báo sự kiện"
                notification.alertBody = tieude
                notification.fireDate = time
                notification.soundName = UILocalNotificationDefaultSoundName
                
                UIApplication.shared.scheduleLocalNotification(notification)
                lich.append(objectLich(a: tieude, b: giothu, c: al, d: dl, e: lap, f: luc, g: diadiem, h: ghichu,i: id,j: time))
            }
            table.reloadData()
            
        } catch {
            
            print("Failed")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        //UIApplication.shared.cancelAllLocalNotifications()
        if(context != nil){
            loadTable()
        }
        if(Const.objLich != nil){
            save(tieude: (Const.objLich?.tieude)!, giothu: (Const.objLich?.giothu)!, al: (Const.objLich?.al)!, dl: (Const.objLich?.dl)!, lap: (Const.objLich?.lap)!, luc: (Const.objLich?.luc)!, diadiem: (Const.objLich?.diadiem)!, ghichu: (Const.objLich?.ghichu)!,time: (Const.objLich?.time)!)
            loadTable()
            Const.objLich = nil
        }
    }
    func save(tieude:String,giothu:String,al:String,dl:String,lap:String,luc:String,diadiem:String,ghichu:String,time:Date){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Lich", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue(tieude, forKey: "tieude")
        newUser.setValue(giothu, forKey: "giothu")
        newUser.setValue(al, forKey: "al")
        newUser.setValue(dl, forKey: "dl")
        newUser.setValue(lap, forKey: "lap")
        newUser.setValue(luc, forKey: "luc")
        newUser.setValue(diadiem, forKey: "diadiem")
        newUser.setValue(ghichu, forKey: "ghichu")
        newUser.setValue(Const.id, forKey: "id")
        newUser.setValue(time, forKey: "time")
        
        
        do {
            
            try context.save()
            //table.reloadData()
            
        } catch {
            
            print("Failed saving")
        }
    }
    @objc func actionThem(tapGestureRecognizer: UITapGestureRecognizer) {
        // Your code goes here
        print("them")
        let them = storyboard?.instantiateViewController(withIdentifier: "themlich")
        self.present(them!, animated: true, completion: nil)
    }
}
