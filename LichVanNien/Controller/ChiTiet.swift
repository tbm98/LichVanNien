//
//  ChiTiet.swift
//  LichVanNien
//
//  Created by TBM on 6/24/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class ChiTiet: UIViewController {
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var naviTitle: UINavigationItem!
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var labelNgayAm: UILabel!
    @IBOutlet weak var labelNgayHoangDao: UILabel!
    @IBOutlet weak var labelGioAm: UILabel!
    @IBOutlet weak var labelGio1: UILabel!
    @IBOutlet weak var labelGio2: UILabel!
    @IBOutlet weak var labelGio3: UILabel!
    @IBOutlet weak var labelGio4: UILabel!
    @IBOutlet weak var labelGio5: UILabel!
    @IBOutlet weak var labelGio6: UILabel!
    @IBOutlet weak var labelTietKhi: UILabel!
    @IBOutlet weak var labelTrucNgay: UILabel!
    @IBOutlet weak var labelViecNenLam: UILabel!
    @IBOutlet weak var labelViecKhongNenLam: UILabel!
    @IBOutlet weak var labelSao: UILabel!
    @IBOutlet weak var labelNguHanh: UILabel!
    @IBOutlet weak var labelConVat: UILabel!
    @IBOutlet weak var labelNen: UILabel!
    @IBOutlet weak var labelKhongNen: UILabel!
    @IBOutlet weak var labelNgoaiLe: UILabel!
    
    var date:Date?
    let calendar = Calendar.current
    var day:Int = 0
    var month:Int = 0
    var year:Int = 0
    
    func initDate(){
        var components = calendar.dateComponents([.year, .month, .day], from: date!)
        day = components.day!
        month = components.month!
        year = components.year!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDate()
        
        naviTitle.title = "\(Const.thu(date: self.date!)), \(self.day)/\(self.month)/\(self.year)"
        
        imageBackground.image = UIImage(named: Const.imageBackgrounds[Const.indexBackground])
        
    }

}
