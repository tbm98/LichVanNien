//
//  ChucNangViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class ChucNangDuoiViewController: UIViewController {

    @IBAction func btn(_ sender: Any) {
        print("chuc nang")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("chuc nang duoi đi load")
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        print("chuc nang duoi đi appear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
