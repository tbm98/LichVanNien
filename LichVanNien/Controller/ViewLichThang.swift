//
//  ViewLichThang.swift
//  LichVanNien
//
//  Created by TBM on 6/29/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class ViewLichThang: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var Calendar: UICollectionView!
    @IBAction func btnPre(_ sender: Any) {
    }
    @IBAction func btnNext(_ sender: Any) {
    }
    
    var date:Date?
    var dele:viewlich?
    
    let Months = [
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
    ]
    let DaysOfMonth = [
        2,
        3,
        4,
        5,
        6,
        7,
        8,
    ]
    
    var DaysInMonths = [
        31,28,31,30,31,30,31,31,30,31,30,31
    ]
    var DaysInMonths2 = [
        31,28,31,30,31,30,31,31,30,31,30,31
    ]
    var dayCN = [6,13,20,27,34,41]
    var currentMonth = 0
    var d = 0
    var m = 0
    var y = 0
    var indexDay = 0
    
    var preMonth = 0
    var preYear = 0
    var preDays = 0
    var nextMonth = 0
    var nextYear = 0
    let vietCalendar = VietCalendar()
    
    func namnhuan(year:Int)->Bool{
        if (year % 100 == 0){
            if (year % 400 == 0){
                return true
            }else{
                false
            }
        }else if (year % 4 == 0) {
            return true
        }else{
            return false
        }
        return true
    }
    
    func thu(date:Date)->Int{
        
        let n = calendar.component(.weekday, from: date)
        switch n {
        case 7:
            return 5
        case 1:
            return 6
        case 2:
            return 0
        case 3:
            return 1
        case 4:
            return 2
        case 5:
            return 3
        case 6:
            return 4
        default:
            break
        }
        return 0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    override func viewWillAppear(_ animated: Bool) {
        
        d = 1//calendar.component(.day, from: self.date!)
        m = calendar.component(.month, from: self.date!)
        y = calendar.component(.year, from: self.date!)
        if(namnhuan(year: y)){
            DaysInMonths = [
                31,29,31,30,31,30,31,31,30,31,30,31
            ]
        }else{
            DaysInMonths = [
                31,28,31,30,31,30,31,31,30,31,30,31
            ]
        }
        print("date:",self.date)
        preMonth = m - 1
        preYear = y
        if(preMonth==0){
            preMonth = 12
            preYear = y - 1
        }
        if(namnhuan(year: preYear)){
            DaysInMonths2 = [
                31,29,31,30,31,30,31,31,30,31,30,31
            ]
        }else{
            DaysInMonths2 = [
                31,28,31,30,31,30,31,31,30,31,30,31
            ]
        }
        preDays = DaysInMonths2[preMonth-1]
        nextMonth = m + 1
        nextYear = y
        if(nextMonth == 13){
            nextMonth = 1
            nextYear = y + 1
        }
        
        indexDay = thu(date: Const.createDate(day: 1, month: m, year: y))
        currentMonth = Months[calendar.component(.month, from: self.date!) - 1]
        monthLabel.text = "Tháng \(currentMonth)-\(calendar.component(.year, from: self.date!))"
        img.image = UIImage(named: Const.imageBackgrounds[Const.indexBackground])
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        m = calendar.component(.month, from: self.date!)
        print("m:",m)
        print("count:",DaysInMonths.count)
        let days = DaysInMonths[m - 1] + indexDay
        if(days<=35){
            return 35
        }else{
            return 42
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
        var title = indexPath.row + 1 - indexDay
        var da = 0
        
        if(dayCN.contains(indexPath.row)){
            cell.Datelabel.textColor = UIColor.red
            
        }
        let dates = Date()
        if(title == calendar.component(.day, from: dates) && m == calendar.component(.month, from: dates) && y == calendar.component(.year, from: dates)){
            cell.vieww.backgroundColor = UIColor.green
        }else{
            cell.vieww.backgroundColor = UIColor.clear
        }
        if(indexPath.row<indexDay){
            title = preDays - (indexDay - 1 - indexPath.row)
            
            cell.Datelabel.textColor = UIColor.gray
            cell.DatelabelAm.textColor = UIColor.gray
            let datepre = vietCalendar.minh(d: title, m: preMonth, y: preYear)
            da = calendar.component(.day, from: datepre)
        }else if(title > DaysInMonths[m - 1]){
            title = title - DaysInMonths[m - 1]//- DaysInMonths[m - 1] + indexDay
            cell.Datelabel.textColor = UIColor.gray
            cell.DatelabelAm.textColor = UIColor.gray
            let datenex = vietCalendar.minh(d: title, m: nextMonth, y: nextYear)
            da = calendar.component(.day, from: datenex)
        }else{
            let datemid = vietCalendar.minh(d: title, m: m, y: y)
            da = calendar.component(.day, from: datemid)
        }
        
        
        cell.Datelabel.text = title.description
        cell.DatelabelAm.text = da.description
        //"\((indexPath.row + 1 - indexDay) % (DaysInMonths[calendar.component(.month, from: self.date!) - 1]+1))"
        return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var title = indexPath.row + 1 - indexDay
        
        if(indexPath.row<indexDay){
            title = preDays - (indexDay - 1 - indexPath.row)
            Const.date = Const.createDate(day: title, month: preMonth, year: preYear)
            dele?.choose()
            return
        }
        if(title > DaysInMonths[m - 1]){
            title = title - DaysInMonths[m - 1]//- DaysInMonths[m - 1] + indexDay
            Const.date = Const.createDate(day: title, month: nextMonth, year: nextYear)
            dele?.choose()
            return
        }
        Const.date = Const.createDate(day: title, month: m, year: y)
        dele?.choose()
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(self.view.frame.height<700){
            // 5s
            return CGSize(width: 35, height: 35)
        }else if (self.view.frame.height>800){
            return CGSize(width: 40, height: 40)
        }else{
            return CGSize(width: 50, height: 50)
        }
        
    }
    
    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 80, height: 80)
//    }
}

