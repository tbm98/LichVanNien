//
//  NaviLich.swift
//  LichVanNien
//
//  Created by TBM on 6/29/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class NaviLich: UIViewController {

    @IBAction func btnBack(_ sender: Any) {
        chucNang?.back()
    }
    @IBAction func btnShare(_ sender: Any) {
        chucNang?.share()
    }
    @IBAction func btnLichCaNhan(_ sender: Any) {
        chucNang?.lichcanhan()
    }
    
    var date:Date?
    var chucNang:navi?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
