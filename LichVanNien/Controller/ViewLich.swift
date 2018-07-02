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
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var top: NSLayoutConstraint!
    var indexBG = 0
    var indexCN = 0
    
    
    
    
    var date:Date?
    let calendar = Calendar.current
    var pageFinish:PageFinish?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topct:CGFloat = (80 as CGFloat).dp
        //if(self.view.frame.height<700){
            top.constant = topct
        //}
        labelNgay.font = UIFont.boldSystemFont(ofSize: (110 as CGFloat).dp)
        print("topct:",topct)
        print("spacing:",(30 as CGFloat).dp)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(!Const.update){
            indexBG = Const.indexBackground
            indexCN = Const.indexChamNgon
        }else{
            //indexBG = Const.indexBackground lay indexBG
        }
        
        let components = calendar.dateComponents([.year, .month, .day], from: date!)
        labelNgay.text = components.day?.description
        
        let thu = Const.thu(date: self.date!)
        if(thu == "Chủ nhật"){
            labelThu.textColor = UIColor.red
        }else{
            labelThu.textColor = UIColor.white
        }
        labelThu.text = thu
        
        labelChamNgon.text = Const.chamNgon[indexCN].description
        imageBackground.image = UIImage(named: Const.imageBackgrounds[indexBG])
        
        
        Const.indexBackground = indexBG
        Const.indexChamNgon = indexCN
        Const.update = true
        
    }
    
    func updateUI(){
        let topct:CGFloat = (40 as CGFloat).dp
        //if(self.view.frame.height<700){
        top.constant = topct
        if(self.view.frame.height<700){
            let topct:CGFloat = (30 as CGFloat).dp
            //if(self.view.frame.height<700){
            top.constant = topct
        }
    }
    

}
