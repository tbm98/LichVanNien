//
//  ThemLich.swift
//  LichVanNien
//
//  Created by TBM on 6/29/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class ThemLich: UIViewController {

    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnDuong(_ sender: Any) {
    }
    @IBAction func btnAm(_ sender: Any) {
    }
    @IBAction func btnBatDau(_ sender: Any) {
        viewPicker.isHidden = !viewPicker.isHidden
    }
    @IBAction func btnKetThuc(_ sender: Any) {
        viewPicker.isHidden = !viewPicker.isHidden
    }
    @IBAction func btnLap(_ sender: Any) {
    }
    @IBAction func btnLuc(_ sender: Any) {
    }
    @IBOutlet weak var ttensk: UITextField!
    @IBOutlet weak var tdiadiem: UITextField!
    @IBOutlet weak var tghichu: UITextField!
    @IBAction func btnLuu(_ sender: Any) {
    }
    @IBOutlet weak var viewPicker: UIView!
    @IBAction func btnXacNhan(_ sender: Any) {

        viewPicker.isHidden = !viewPicker.isHidden
    }
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
