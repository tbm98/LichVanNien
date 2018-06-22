//
//  ChiTiet2ViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class ChiTiet2ViewController: UIViewController {

    @IBOutlet weak var imageBackground: UIImageView!
    @IBAction func btn(_ sender: Any) {
        print("click")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
//        let image = UIImage(named: Const.imageBackgrounds[Const.randomInt(min: 0, max: 14)])
//        image?.scale = .
//        view.backgroundColor = UIColor(patternImage: UIImage(named: Const.imageBackgrounds[Const.randomInt(min: 0, max: 14)])!)
        //imageBackground.image = UIImage(named: Const.imageBackgrounds[Const.randomInt(min: 0, max: 14)])
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        imageBackground.image = UIImage(named: Const.imageBackgrounds[Const.randomInt(min: 0, max: 14)])
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
