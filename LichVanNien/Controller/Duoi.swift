//
//  ChucNangViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class Duoi: UIViewController {

    @IBOutlet weak var lb1: UILabel!
    @IBOutlet weak var lb2: UILabel!
    @IBOutlet weak var lb3: UILabel!
    @IBOutlet weak var lb4: UILabel!
    @IBOutlet weak var lb5: UILabel!
    @IBOutlet weak var lb6: UILabel!
    @IBOutlet weak var lb7: UILabel!
    @IBOutlet weak var lb8: UILabel!
    @IBOutlet weak var lb9: UILabel!
    @IBOutlet weak var lb10: UILabel!
    @IBOutlet weak var lb11: UILabel!
    @IBOutlet weak var lb12: UILabel!
    @IBOutlet weak var lb13: UILabel!
    
    @IBOutlet weak var stackThem: UIStackView!
    @IBOutlet weak var stackThayDoi: UIStackView!
    @IBOutlet weak var stackThang: UIStackView!
    @IBOutlet weak var stackChiTiet: UIStackView!
    @IBOutlet weak var labelTenNam: UILabel!
    @IBOutlet weak var labelTenNgay: UILabel!
    @IBOutlet weak var labelTenGio: UILabel!
    @IBOutlet weak var labelGio: UILabel!
    @IBOutlet weak var labelThang: UILabel!
    @IBOutlet weak var labelNgay: UILabel!
    var date:Date?
    let calendar = Calendar.current
    var chucNang:ChucNangDuoi?
    var lichAm:Date?
    var vietCalendar = VietCalendar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("chuc nang duoi đi load")
        print("chuc nang duoi đi load")
        
        let components = calendar.dateComponents([.year, .month, .day], from: date!)
        lichAm = vietCalendar.minh(d: components.day!, m: components.month!, y: components.year!)
        let components2 = calendar.dateComponents([.year, .month, .day], from: lichAm!)
        labelThang.text = components2.month?.description
        labelNgay.text = components2.day?.description
        
        let hour = calendar.component(.hour, from: date!)
        let minutes = calendar.component(.minute, from: date!)
        var h:String = "\(hour)"
        var m:String = "\(minutes)"
        if(minutes<10){
            m = "0\(minutes)"
        }
        if(hour<10){
            h = "0\(hour)"
        }
        labelGio.text = "\(h):\(m)"
        
        lb1.font = UIFont.systemFont(ofSize: (14 as CGFloat).dp)
        lb2.font = UIFont.systemFont(ofSize: (14 as CGFloat).dp)
        lb3.font = UIFont.systemFont(ofSize: (14 as CGFloat).dp)
        lb4.font = UIFont.systemFont(ofSize: (14 as CGFloat).dp)
        lb5.font = UIFont.systemFont(ofSize: (14 as CGFloat).dp)
        lb6.font = UIFont.systemFont(ofSize: (14 as CGFloat).dp)
        lb7.font = UIFont.systemFont(ofSize: (14 as CGFloat).dp)
        lb8.font = UIFont.systemFont(ofSize: (14 as CGFloat).dp)
        lb9.font = UIFont.systemFont(ofSize: (14 as CGFloat).dp)
        lb10.font = UIFont.systemFont(ofSize: (14 as CGFloat).dp)
        lb11.font = UIFont.boldSystemFont(ofSize: (20 as CGFloat).dp)
        lb12.font = UIFont.boldSystemFont(ofSize: (20 as CGFloat).dp)
        lb13.font = UIFont.boldSystemFont(ofSize: (20 as CGFloat).dp)
        if(self.view.frame.height<700){
            lb7.font = UIFont.systemFont(ofSize: (10 as CGFloat).dp)
            lb8.font = UIFont.systemFont(ofSize: (10 as CGFloat).dp)
            lb9.font = UIFont.systemFont(ofSize: (10 as CGFloat).dp)
            lb10.font = UIFont.systemFont(ofSize: (10 as CGFloat).dp)
        }
        if(self.view.frame.height>800){
            lb7.font = UIFont.systemFont(ofSize: (12 as CGFloat).dp)
            lb8.font = UIFont.systemFont(ofSize: (12 as CGFloat).dp)
            lb9.font = UIFont.systemFont(ofSize: (12 as CGFloat).dp)
            lb10.font = UIFont.systemFont(ofSize: (12 as CGFloat).dp)
        }
        
        //
        //print(Const.getCanChiLunarDay(dd: calendar.component(.day, from: lichAm!), mm: calendar.component(.month, from: lichAm!), yy: calendar.component(.year, from: lichAm!)))
        
        print("licham:",lichAm)
        let canchi = Const.getCanChiLunarDay(dd: calendar.component(.day, from: lichAm!), mm: calendar.component(.month, from: lichAm!), yy: calendar.component(.year, from: lichAm!))
        let tcc = Const.thangcanchi(time: lichAm!)
        let ccD = "\(Const.can[tcc[0]]) \(Const.chi[tcc[1]])"
        let ccA = "\(Const.namcanchi(time: lichAm!))"
        var canN = canchi[0]
        canN = canN - 2
        if(canN < 0){
            canN = 10 + canN
        }
        
        var chiN = canchi[1]
        //        print("chiN:",chiN)
        chiN = chiN - 4
        if(chiN < 0){
            chiN = 12 + chiN// - 12
        }
        let ccN = "\(Const.can[canN]) \(Const.chi[chiN])"
        print(ccD)
        print(ccA)
        labelTenNam.text = """
        \(ccD)
        \(ccA)
        """
        labelTenNgay.text = ccN
        let ccH = Const.gioCanChi(hour: hour, can: canN)
        labelTenGio.text = "\(Const.can[ccH[0]]) \(Const.chi[ccH[1]])"
        setClick()
    }
    
    
   
    func updateUI(date:Date){
        self.date = date
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        lichAm = vietCalendar.minh(d: components.day!, m: components.month!, y: components.year!)
        print("licham:",lichAm)
        let canchi = Const.getCanChiLunarDay(dd: calendar.component(.day, from: lichAm!), mm: calendar.component(.month, from: lichAm!), yy: calendar.component(.year, from: lichAm!))
        let tcc = Const.thangcanchi(time: lichAm!)
        let ccD = "\(Const.can[tcc[0]]) \(Const.chi[tcc[1]])"
        let ccA = "\(Const.namcanchi(time: lichAm!))"
        var canN = canchi[0]
        canN = canN - 2
        if(canN < 0){
            canN = 10 + canN
        }
        
        var chiN = canchi[1]
//        print("chiN:",chiN)
        chiN = chiN - 4
        if(chiN < 0){
            chiN = 12 + chiN// - 12
        }
        let ccN = "\(Const.can[canN]) \(Const.chi[chiN])"
        print(ccD)
        print(ccA)
        labelTenNam.text = """
        \(ccD)
        \(ccA)
        """
        labelTenNgay.text = ccN
        let date = Date()
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        labelGio.text = "\(hour):\(minutes)"
        let ccH = Const.gioCanChi(hour: hour, can: canN)
        labelTenGio.text = "\(Const.can[ccH[0]]) \(Const.chi[ccH[1]])"
        let components2 = calendar.dateComponents([.year, .month, .day], from: lichAm!)
        labelThang.text = components2.month?.description
        labelNgay.text = components2.day?.description
        
        
    }
    
    func setClick(){
        stackThem.isUserInteractionEnabled = true
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(actionThem(tapGestureRecognizer:)))
        stackThem.addGestureRecognizer(tapGesture1)
        
        stackThang.isUserInteractionEnabled = true
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(actionThang(tapGestureRecognizer:)))
        stackThang.addGestureRecognizer(tapGesture2)
        
        stackChiTiet.isUserInteractionEnabled = true
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(actionChiTiet(tapGestureRecognizer:)))
        stackChiTiet.addGestureRecognizer(tapGesture3)
        
        stackThayDoi.isUserInteractionEnabled = true
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(actionThayDoi(tapGestureRecognizer:)))
        stackThayDoi.addGestureRecognizer(tapGesture4)
    }
    
    @objc func actionChiTiet(tapGestureRecognizer: UITapGestureRecognizer) {
        // Your code goes here
        print("chi tiet")
        chucNang?.chiTiet()
    }
    @objc func actionThang(tapGestureRecognizer: UITapGestureRecognizer) {
        // Your code goes here
        print("thang")
        chucNang?.lichThang()
    }
    @objc func actionThayDoi(tapGestureRecognizer: UITapGestureRecognizer) {
        // Your code goes here
        print("thay doi")
        chucNang?.doiNgay()
    }
    @objc func actionThem(tapGestureRecognizer: UITapGestureRecognizer) {
        // Your code goes here
        print("them")
        chucNang?.nhieuHon()
    }

    override func viewDidAppear(_ animated: Bool) {
        print("chuc nang duoi đi appear")
    }


}
