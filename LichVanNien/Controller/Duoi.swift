//
//  ChucNangViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class Duoi: UIViewController {


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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("chuc nang duoi đi load")
        let components = calendar.dateComponents([.year, .month, .day], from: date!)
        labelThang.text = components.month?.description
        labelNgay.text = components.day?.description
        
        let hour = calendar.component(.hour, from: date!)
        let minutes = calendar.component(.minute, from: date!)
        labelGio.text = "\(hour):\(minutes)"
        setClick()
    }
    func updateUI(date:Date){
        self.date = date
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        labelThang.text = components.month?.description
        labelNgay.text = components.day?.description
        
        let date = Date()
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        labelGio.text = "\(hour):\(minutes)"
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
