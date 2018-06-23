//
//  ChiTiet1ViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class ViewLich: UIViewController {

    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var labelNgay: UILabel!
    @IBOutlet weak var labelThu: UILabel!
    @IBOutlet weak var labelChamNgon: UILabel!
    
    var date:Date?
    let calendar = Calendar.current
    var pageFinish:PageFinish?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageBackground.image = UIImage(named: Const.imageBackgrounds[Const.randomInt(min: 0, max: 14)])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let components = calendar.dateComponents([.year, .month, .day], from: date!)
        labelNgay.text = components.day?.description
        labelChamNgon.text = Const.chamNgon[Const.randomInt(min: 0, max: Const.chamNgon.count-1)].description
        let thu = Const.thu(date: self.date!)
        if(thu == "Chủ nhật"){
            labelThu.textColor = UIColor.red
        }else{
            labelThu.textColor = UIColor.white
        }
        labelThu.text = thu
        print("year:",components.year)
        print("month:",components.month)
        print("day:",components.day)
        self.pageFinish?.updateUI(date: self.date!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //imageBackground.imageWithFade = UIImage(named: Const.imageBackgrounds[Const.randomInt(min: 0, max: 14)])
    }

}
