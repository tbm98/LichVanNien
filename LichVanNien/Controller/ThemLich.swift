//
//  ThemLich.swift
//  LichVanNien
//
//  Created by TBM on 6/29/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit
import CoreData
import GoogleMobileAds


class ThemLich: UIViewController {

    var mode = 1
    var dateBD:Date?
    var dateKT:Date?
    var lap = 1
    var luc = 1
    var date = Date()
    var calendar = Calendar.current
    
    var appDelegate:AppDelegate?// = UIApplication.shared.delegate as! AppDelegate
    
    var context:NSManagedObjectContext?// = appDelegate.persistentContainer.viewContext
    

    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var labelDuong: UIButton!
    @IBOutlet weak var labelAm: UIButton!
    @IBAction func btnDuong(_ sender: Any) {
        labelDuong.isSelected = true
        labelAm.isSelected = false
    }
    @IBAction func btnAm(_ sender: Any) {
        labelDuong.isSelected = false
        labelAm.isSelected = true
    }
    @IBOutlet weak var batdau: UIButton!
    @IBAction func btnBatDau(_ sender: Any) {
        mode = 1
        viewPicker.isHidden = !viewPicker.isHidden
    }
    @IBOutlet weak var ketthuc: UIButton!
    @IBAction func btnKetThuc(_ sender: Any) {
        mode = 2
        viewPicker.isHidden = !viewPicker.isHidden
    }
    @IBOutlet weak var viewLap: UIStackView!
    @IBOutlet weak var labelLap: UIButton!
    @IBAction func btnLap(_ sender: Any) {
        viewLap.isHidden = !viewLap.isHidden
    }
    @IBAction func btnLap1(_ sender: Any) {
        labelLap.setTitle("Không Lặp", for: .normal)
        lap = 1
        viewLap.isHidden = !viewLap.isHidden
    }
    @IBAction func btnLap2(_ sender: Any) {
        labelLap.setTitle("Hàng Ngày", for: .normal)
        lap = 2
        viewLap.isHidden = !viewLap.isHidden
    }
    @IBAction func btnLap3(_ sender: Any) {
        labelLap.setTitle("Hàng Tuần", for: .normal)
        lap = 3
        viewLap.isHidden = !viewLap.isHidden
    }
    @IBAction func btnLap4(_ sender: Any) {
        labelLap.setTitle("Hàng Tháng", for: .normal)
        lap = 4
        viewLap.isHidden = !viewLap.isHidden
    }
    @IBAction func btnLap5(_ sender: Any) {
        labelLap.setTitle("Hàng Năm", for: .normal)
        lap = 5
        viewLap.isHidden = !viewLap.isHidden
    }
    @IBOutlet weak var viewLuc: UIStackView!
    @IBOutlet weak var labelLuc: UIButton!
    @IBAction func btnLuc(_ sender: Any) {
        viewLuc.isHidden = !viewLuc.isHidden
    }
    @IBAction func btnLuc1(_ sender: Any) {
        luc = 1
        labelLuc.setTitle("Vào Lúc Diễn Ra", for: .normal)
        viewLuc.isHidden = !viewLuc.isHidden
    }
    @IBAction func btnLuc2(_ sender: Any) {
        luc = 2
        labelLuc.setTitle("Trước 5 Phút", for: .normal)
        viewLuc.isHidden = !viewLuc.isHidden
    }
    @IBAction func btnLuc3(_ sender: Any) {
        luc = 3
        labelLuc.setTitle("Trước 15 Phút", for: .normal)
        viewLuc.isHidden = !viewLuc.isHidden
    }
    @IBAction func btnLuc4(_ sender: Any) {
        luc = 4
        labelLuc.setTitle("Trước 30 Phút", for: .normal)
        viewLuc.isHidden = !viewLuc.isHidden
    }
    @IBAction func btnLuc5(_ sender: Any) {
        luc = 5
        labelLuc.setTitle("Trước 1 Giờ", for: .normal)
        viewLuc.isHidden = !viewLuc.isHidden
    }
    @IBAction func btnLuc6(_ sender: Any) {
        luc = 6
        labelLuc.setTitle("Trước 1 Ngày", for: .normal)
        viewLuc.isHidden = !viewLuc.isHidden
    }
    
    @IBOutlet weak var ttensk: UITextField!
    @IBOutlet weak var tdiadiem: UITextField!
    @IBOutlet weak var tghichu: UITextField!
    @IBAction func btnLuu(_ sender: Any) {
        if(!(ttensk.text?.isEmpty)!){
            let d = calendar.component(.day, from: dateBD!)
            let m = calendar.component(.month, from: dateBD!)
            let y = calendar.component(.year, from: dateBD!)
            let tieude = ttensk.text
            let giothu = convertThu(date: dateBD!)
            let al = convertDay(date: VietCalendar().minh(d: d, m: m, y: y))
            let dl = convertDay(date: dateBD!)
            let lap = labelLap.titleLabel?.text
            let luc = labelLuc.titleLabel?.text
            var diadiem = tdiadiem.text
            if(diadiem?.count == 0){
                diadiem = "Không"
            }
            var ghichu = tghichu.text
            if(ghichu?.count == 0){
                ghichu =  "Không"
            }
            self.save(tieude: tieude!, giothu: giothu, al: al, dl: dl, lap: lap!, luc: luc!, diadiem: diadiem!, ghichu: ghichu!)
            Const.objLich = nil
            self.dismiss(animated: true, completion: nil)
        }else{
            let alertController = UIAlertController(title: "Thông báo", message: "Bạn chưa nhập tên sự kiện!", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction) in
                print("you've pressed ok")
            }
            
            alertController.addAction(action1)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    @IBOutlet weak var viewPicker: UIView!
    @IBAction func btnXacNhan(_ sender: Any) {

        viewPicker.isHidden = !viewPicker.isHidden
        if(mode==1){
            dateBD = datePicker.date
            batdau.setTitle(convert(date: dateBD!), for: .normal)
        }else{
            dateKT = datePicker.date
            ketthuc.setTitle(convert(date: dateKT!), for: .normal)
        }
    }
    @IBOutlet weak var datePicker: UIDatePicker!
    
    func convert(date:Date)->String{
        let cal = Calendar.current
        let y:Int = cal.component(.year, from: date)
        let m:Int = cal.component(.month, from: date)
        let d:Int = cal.component(.day, from: date)
        let h:Int = cal.component(.hour
            , from: date)
        let mi:Int = cal.component(.minute, from: date)
        var hh:String = "\(h)"
        var mm:String = "\(mi)"
        if(mi<10){
            mm = "0\(mi)"
        }
        if(h<10){
            hh = "0\(h)"
        }
        return "\(hh):\(mm), \(d)/\(m)/\(y)"
    }
    
    func convertThu(date:Date)->String{
        let cal = Calendar.current
        let thu:String = Const.thu(date: date)
        let h:Int = cal.component(.hour
            , from: date)
        let mi:Int = cal.component(.minute, from: date)
        var hh:String = "\(h)"
        var mm:String = "\(mi)"
        if(mi<10){
            mm = "0\(mi)"
        }
        if(h<10){
            hh = "0\(h)"
        }
        return "\(hh):\(mm) - \(thu)"
    }
    func convertDay(date:Date)->String{
        let cal = Calendar.current
        let y:Int = cal.component(.year, from: date)
        let m:Int = cal.component(.month, from: date)
        let d:Int = cal.component(.day, from: date)
        var dd:String = "\(d)"
        var mm:String = "\(m)"
        if(m<10){
            mm = "0\(m)"
        }
        if(d<10){
            dd = "0\(d)"
        }
        return "\(dd)/\(mm)/\(y)"
    }
    
    func save(tieude:String,giothu:String,al:String,dl:String,lap:String,luc:String,diadiem:String,ghichu:String){
        
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
        newUser.setValue(dateBD, forKey: "time")
        
        
                do {
        
                    try context.save()
                    //table.reloadData()
        
                } catch {
        
                    print("Failed saving")
                }
    }
    var bannerView: GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //init view
        batdau.setTitle(convert(date: self.date), for: .normal)
        ketthuc.setTitle(convert(date: self.date), for: .normal)
        dateBD = self.date
        dateKT = self.date
        
        if(Const.objLich != nil){
            batdau.setTitle(convert(date: (Const.objLich?.time)!) , for: .normal)
            ketthuc.setTitle(convert(date: (Const.objLich?.time)!) , for: .normal)
            labelAm.setTitle(Const.objLich?.al, for: .normal)
            labelLap.setTitle(Const.objLich?.lap, for: .normal)
            labelLuc.setTitle(Const.objLich?.luc, for: .normal)
            ttensk.text = Const.objLich?.tieude
            tghichu.text = Const.objLich?.ghichu
            tdiadiem.text = Const.objLich?.diadiem
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Lich", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait
)
        
        addBannerViewToView(bannerView)
        bannerView.adUnitID = Const.bannerId
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)

    }
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        ttensk.resignFirstResponder()
        tghichu.resignFirstResponder()
        tdiadiem.resignFirstResponder()
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
}
