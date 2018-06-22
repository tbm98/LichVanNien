//
//  ChucNangViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class ChucNangDuoiViewController: UIViewController {


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
    override func viewDidLoad() {
        super.viewDidLoad()
        print("chuc nang duoi đi load")
        // Do any additional setup after loading the view.
        setClick()
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
    }
    @objc func actionThang(tapGestureRecognizer: UITapGestureRecognizer) {
        // Your code goes here
        print("thang")
    }
    @objc func actionThayDoi(tapGestureRecognizer: UITapGestureRecognizer) {
        // Your code goes here
        print("thay doi")
    }
    @objc func actionThem(tapGestureRecognizer: UITapGestureRecognizer) {
        // Your code goes here
        print("them")
    }

    override func viewDidAppear(_ animated: Bool) {
        print("chuc nang duoi đi appear")
    }


}
