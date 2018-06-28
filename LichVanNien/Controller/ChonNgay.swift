//
//  ChonNgay.swift
//  LichVanNien
//
//  Created by TBM on 6/27/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class ChonNgay: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{
    @IBOutlet weak var pickerDay: UIPickerView!
    @IBOutlet weak var pickerMonth: UIPickerView!
    @IBOutlet weak var pickerYear: UIPickerView!
    @IBAction func btnChonNgay(_ sender: Any) {
        if(duong){
            dele?.done(date: Const.createDate(day: d, month: m, year: y))
        }else{
            dele?.done(date: vietCalendar.minh2(d: d, m: m, y: y))
        }
        
    }
    @IBOutlet weak var ngayduong: UIButton!
    @IBOutlet weak var ngayam: UIButton!
    @IBAction func btnNgayDuong(_ sender: Any) {
        ngayam.isSelected = false
        ngayduong.isSelected = true
        duong = true
        initDay(m: self.m)
    }
    @IBAction func btnNgayAm(_ sender: Any) {
        ngayduong.isSelected = false
        ngayam.isSelected = true
        duong = false
        initDay(m: self.m)
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
    var n31 = [1,3,5,7,8,10,12]
    var n30 = [4,6,9,11]
    var n289 = 2
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case pickerDay:
            return day.count
        case pickerMonth:
            return month.count
        case pickerYear:
            return year.count
        default:
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case pickerDay:
            return day[row].description
        case pickerMonth:
            return month[row].description
        case pickerYear:
            return year[row].description
        default:
            return "nil"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case pickerDay:
            d = day[row]
        case pickerMonth:
            initDay(m: month[row])
            m = month[row]
        case pickerYear:
            y = year[row]
            initDay(m: m)
        default:
            break
        }
    }
    
    var date = Date()
    var calendar = Calendar.current
    var dayi:Int = 0
    var monthi:Int = 0
    var yeari:Int = 0
    var dele:ChonNgayXong?
    var duong = true
    var vietCalendar = VietCalendar()
    
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
    func initDay(m:Int){
        if(duong){
            initDuong(m: m)
        }else{
            initAm(m: m)
        }
    }
    func initAm(m:Int){
        day = day30
        pickerDay.reloadAllComponents()
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
        pickerDay.reloadAllComponents()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let component = calendar.dateComponents([.year, .month, .day], from: self.date)
        if(n31.contains(component.month!)){
            day = day31
        }
        
        pickerDay.reloadAllComponents()
        
        
        
        pickerYear.selectRow(year.index(of: component.year!)!, inComponent: 0, animated: false)
        pickerMonth.selectRow(month.index(of: component.month!)!, inComponent: 0, animated: false)
        pickerDay.selectRow(day.index(of: component.day!)!, inComponent: 0, animated: false)
        
        d = component.day!
        m = component.month!
        y = component.year!

        // Do any additional setup after loading the view.
    }


}
