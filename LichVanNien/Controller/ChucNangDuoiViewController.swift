//
//  ChucNangViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class ChucNangDuoiViewController: UIViewController {


    @IBOutlet weak var labelThang: UILabel!
    @IBOutlet weak var labelNgay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("chuc nang duoi đi load")
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        print("chuc nang duoi đi appear")
    }


}
