//
//  DoiNgayViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class DoiNgay: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnShare(_ sender: Any) {
        let image:[Any] = [UIApplication.shared.screenShot as Any]
        let activityVC = UIActivityViewController(activityItems: image, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    @IBOutlet weak var pickerDay1: UIPickerView!
    @IBOutlet weak var pickerMonth1: UIPickerView!
    @IBOutlet weak var pickerYear1: UIPickerView!
    @IBOutlet weak var pickerDay2: UIPickerView!
    @IBOutlet weak var pickerMonth2: UIPickerView!
    @IBOutlet weak var pickerYear2: UIPickerView!
    @IBAction func btnXem(_ sender: Any) {
        Const.date = Const.createDate(day: d, month: m, year: y)
        self.dismiss(animated: true, completion: nil)
    }
    var day:[Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
    var day31:[Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
    var day30:[Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
    var day29:[Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29]
    var day28:[Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]
    var month:[Int] = [1,2,3,4,5,6,7,8,9,10,11,12]
    var year :[Int] = [1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030]
    var d:Int = 0
    var m:Int = 0
    var y:Int = 0
    var d2:Int = 0
    var m2:Int = 0
    var y2:Int = 0
    var n31 = [1,3,5,7,8,10,12]
    var n30 = [4,6,9,11]
    var n289 = 2

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case pickerDay1:
            return day.count
        case pickerMonth1:
            return month.count
        case pickerYear1:
            return year.count
        case pickerDay2:
            return day.count
        case pickerMonth2:
            return month.count
        case pickerYear2:
            return year.count
        default:
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case pickerDay1:
            return day[row].description
        case pickerMonth1:
            return month[row].description
        case pickerYear1:
            return year[row].description
        case pickerDay2:
            return day[row].description
        case pickerMonth2:
            return month[row].description
        case pickerYear2:
            return year[row].description
        default:
            return "nil"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case pickerDay1:
            d = day[row]
            updateAm()
        case pickerMonth1:
            m = month[row]
            initDuong(m: m)
            updateAm()
        case pickerYear1:
            y = year[row]
            initDuong(m: m)
            updateAm()
        case pickerDay2:
            d2 = day[row]
            updateAm()
        case pickerMonth2:
            m2 = month[row]
            updateAm()
        case pickerYear2:
            y2 = year[row]
            updateAm()
        default:
            break
        }
    }
    var date = Date()
    var calendar = Calendar.current
    var vietCalendar = VietCalendar()
    
    func initPickerAm(){
        pickerYear2.selectRow(year.index(of: y2)!, inComponent: 0, animated: false)
        pickerMonth2.selectRow(month.index(of: m2)!, inComponent: 0, animated: false)
        pickerDay2.selectRow(day.index(of: d2)!, inComponent: 0, animated: false)
    }
    func initPickerDuong(){
        pickerYear1.selectRow(year.index(of: y)!, inComponent: 0, animated: false)
        pickerMonth1.selectRow(month.index(of: m)!, inComponent: 0, animated: false)
        pickerDay1.selectRow(day.index(of: d)!, inComponent: 0, animated: false)
    }
    func updateAm(){
        let dateAm = vietCalendar.minh(d: d, m: m, y: y)
        let component = calendar.dateComponents([.year,.month,.day], from: dateAm)
        y2 = component.year!
        m2 = component.month!
        d2 = component.day!
        initPickerAm()
    }
    func updateDuong(){
        let dateDuong = vietCalendar.minh2(d: d2, m: m2, y: y2)
        let component = calendar.dateComponents([.year,.month,.day], from: dateDuong)
        y = component.year!
        m = component.month!
        d = component.day!
        initPickerDuong()
    }
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
//    func initDay(m:Int){
//        if(duong){
//            initDuong(m: m)
//        }else{
//            initAm(m: m)
//        }
//    }
    func initAm(m:Int){
        day = day30
        pickerDay2.reloadAllComponents()
    }
    func initDuong(m:Int){
        if(n31.contains(m)){
            day = day31
        }
        if(n30.contains(m)){
            day = day30
        }
        if(m==2){
            if(namnhuan(year: y)){
                day = day29
            }else{
                day = day28
            }
            
        }
        pickerDay1.reloadAllComponents()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let component = calendar.dateComponents([.year, .month, .day], from: self.date)
        y = component.year!
        m = component.month!
        d = component.day!
        pickerYear1.selectRow(year.index(of: component.year!)!, inComponent: 0, animated: false)
        pickerMonth1.selectRow(month.index(of: component.month!)!, inComponent: 0, animated: false)
        pickerDay1.selectRow(day.index(of: component.day!)!, inComponent: 0, animated: false)
        updateAm()
//        pickerYear2.selectRow(year.index(of: component.year!)!, inComponent: 0, animated: false)
//        pickerMonth2.selectRow(month.index(of: component.month!)!, inComponent: 0, animated: false)
//        pickerDay2.selectRow(day.index(of: component.day!)!, inComponent: 0, animated: false)
//        d = component.day!
//        m = component.month!
//        y = component.year!
        // Do any additional setup after loading the view.
    }

}
