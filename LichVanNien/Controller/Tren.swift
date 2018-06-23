//
//  ChucNangTrenViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/22/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class Tren: UIViewController {

    @IBAction func btnThoiTiet(_ sender: Any) {
        chucNang?.thoiTiet()
    }
    @IBAction func btnLichCaNhan(_ sender: Any) {
        chucNang?.lichCaNhan()
    }
    @IBAction func btnShare(_ sender: Any) {
        chucNang?.share()
    }
    @IBAction func btnChonNgay(_ sender: Any) {
        chucNang?.chonThang()
    }
    @IBAction func btnHomNay(_ sender: Any) {
        chucNang?.homNay()
    }
    var date:Date?
    var chucNang:ChucNangTren?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("chuc nang tren đi load")
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        print("chuc nang tren đi appear")
    }


}
