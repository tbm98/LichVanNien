//
//  ChiTiet1ViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class ChiTietViewController: UIViewController {

    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var labelNgay: UILabel!
    @IBOutlet weak var labelThu: UILabel!
    @IBOutlet weak var labelChamNgon: UILabel!
    
    
    var date:Date?
    let calendar = Calendar.current
    var pageFinish:PageFinish?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("view did load")
        //view.backgroundColor = UIColor(patternImage: UIImage(named: Const.imageBackgrounds[Const.randomInt(min: 0, max: 14)])!)
        imageBackground.image = UIImage(named: Const.imageBackgrounds[Const.randomInt(min: 0, max: 14)])
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let components = calendar.dateComponents([.year, .month, .day], from: date!)
        labelNgay.text = components.day?.description
        print("year:",components.year)
        print("month:",components.month)
        print("day:",components.day)
        self.pageFinish?.updateUI(date: self.date!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //imageBackground.imageWithFade = UIImage(named: Const.imageBackgrounds[Const.randomInt(min: 0, max: 14)])
        
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
