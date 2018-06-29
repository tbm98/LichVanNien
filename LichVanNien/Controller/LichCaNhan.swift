//
//  LichCaNhan.swift
//  LichVanNien
//
//  Created by TBM on 6/24/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit
import CoreData

class LichCaNhan: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var lich:[objectLich] = [
        objectLich(a: "a", b: "a", c: "a", d: "a", e: "a", f: "a", g: "a", h: "a"),
        objectLich(a: "a", b: "a", c: "a", d: "a", e: "a", f: "a", g: "a", h: "a"),
        objectLich(a: "a", b: "a", c: "a", d: "a", e: "a", f: "a", g: "a", h: "a"),
        objectLich(a: "a", b: "a", c: "a", d: "a", e: "a", f: "a", g: "a", h: "a"),
        objectLich(a: "a", b: "a", c: "a", d: "a", e: "a", f: "a", g: "a", h: "a"),
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
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnShare(_ sender: Any) {
        let image:[Any] = [UIApplication.shared.screenShot as Any]
        let activityVC = UIActivityViewController(activityItems: image, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.isUserInteractionEnabled = true
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(actionThem(tapGestureRecognizer:)))
        btn.addGestureRecognizer(tapGesture1)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Lich", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue("hop", forKey: "tieude")
        newUser.setValue("11:22 thu 5", forKey: "giothu")
        newUser.setValue("11/22/2018", forKey: "al")
        newUser.setValue("11/23/2018", forKey: "dl")
        newUser.setValue("khong lap", forKey: "lap")
        newUser.setValue("ngay hien tai", forKey: "luc")
        newUser.setValue("ictu", forKey: "diadiem")
        newUser.setValue("di choi ", forKey: "ghichu")

        
//        do {
//
//            try context.save()
//            //table.reloadData()
//
//        } catch {
//
//            print("Failed saving")
//        }
        
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
        
        do {
            let result = try context.fetch(request)
            lich.removeAll()
            for data in result as! [NSManagedObject] {
                //print(data.value(forKey: "tieude") as! String)
                tieude = data.value(forKey: "tieude") as! String
                giothu = data.value(forKey: "giothu") as! String
                al = data.value(forKey: "al") as! String
                dl = data.value(forKey: "dl") as! String
                lap = data.value(forKey: "lap") as! String
                luc = data.value(forKey: "luc") as! String
                diadiem = data.value(forKey: "diadiem") as! String
                ghichu = data.value(forKey: "ghichu") as! String
                lich.append(objectLich(a: tieude, b: giothu, c: al, d: dl, e: lap, f: luc, g: diadiem, h: ghichu))
            }
            table.reloadData()
            
        } catch {
            
            print("Failed")
        }
        // Do any additional setup after loading the view.
    }
    @objc func actionThem(tapGestureRecognizer: UITapGestureRecognizer) {
        // Your code goes here
        print("them")
        let them = storyboard?.instantiateViewController(withIdentifier: "themlich")
        self.present(them!, animated: true, completion: nil)
    }
}
