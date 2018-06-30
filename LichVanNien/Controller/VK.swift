//
//  VK.swift
//  LichVanNien
//
//  Created by TBM on 6/25/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class VK: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return title2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellVK", for: indexPath)
        cell.textLabel?.text = title2[indexPath.row]
        if(contain(row: title2[indexPath.row])){
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        }else{
            cell.textLabel?.font = UIFont.systemFont(ofSize: 17)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexRow:",indexPath.row)
        let tt = title2[indexPath.row]
        switch tt {
        case index[0]:
            if(indexHide[0]){
                showTitle(min: 0, max: 10)
            }else{
                hideTitle(min: 1, max: 9)
            }
            indexHide[0] = !indexHide[0]
            
        case index[1]:
            if(indexHide[1]){
                showTitle(min: 10, max: 17)
            }else{
                hideTitle(min: 11, max: 16)
            }
            indexHide[1] = !indexHide[1]
        case index[2]:
            if(indexHide[2]){
                showTitle(min: 17, max: 24)
            }else{
                hideTitle(min: 18, max: 23)
            }
            indexHide[2] = !indexHide[2]
        case index[3]:
            if(indexHide[2]){
                showTitle(min: 24, max: 31)
            }else{
                hideTitle(min: 25, max: 30)
            }
            indexHide[2] = !indexHide[2]
        case index[4]:
            if(indexHide[3]){
                showTitle(min: 31, max: 41)
            }else{
                hideTitle(min: 32, max: 40)
            }
            indexHide[3] = !indexHide[3]
        case index[5]:
            if(indexHide[4]){
                showTitle(min: 41, max: 52)
            }else{
                hideTitle(min: 42, max: 51)
            }
            indexHide[4] = !indexHide[4]
        case index[6]:
            if(indexHide[5]){
                showTitle(min: 52, max: 56)
            }else{
                hideTitle(min: 53, max: 55)
            }
            indexHide[5] = !indexHide[5]
        case index[7]:
            if(indexHide[6]){
                showTitle(min: 56, max: 59)
            }else{
                hideTitle(min: 57, max: 59)
            }
            indexHide[6] = !indexHide[6]
        default:
            Const.indexVanKhan = indexPath.row
            showChiTiet()
        }
        tableView.reloadData()
    }
    
    func showChiTiet(){
        let chitietVK = storyboard?.instantiateViewController(withIdentifier: "chitietvankhan")
        self.present(chitietVK!, animated: true, completion: nil)
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnShare(_ sender: Any) {
        let image:[Any] = [UIApplication.shared.screenShot as Any]
        let activityVC = UIActivityViewController(activityItems: image, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    @IBAction func btnDanhGia(_ sender: Any) {
        guard let url = URL(string: "itms-apps://itunes.apple.com/app/id1253533671") else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    

    let titleVanKhan = [
        "Văn Khấn Lễ Tết","  Khấn Tổ Tiên Ngày Tết","  Khấn Thần Linh Ngày Tết","  Khấn Tất Niên","  Khấn Giao Thừa Ngoài Trời","  Khấn Giao Thừa Trong Nhà","  Khấn Tạ Năm Mới","  Khấn Ông Táo Chầu Trời","  Lễ Mộ 30 Tết","  Khấn Lễ Thăm Mộ",
        "Văn Khấn Hàng Tháng","  Văn Khấn Tiền Chủ","  Văn Khấn Thánh Sư","  Văn Khấn Thổ Công","  Văn Khấn Thần Tài","  Khấn Mùng 1 Và Ngày Rằm","  Trình Tự Dâng Lễ",
        "Văn Khấn Gia Trạch","  Chuyển Nhà, Sửa Chữa Lớn","  Lễ Tân Gia","  Lễ Nhập Trạch","  Khai Trương Cửa Hàng","  Lễ Hội Hoàn Địa Mạch","  Lễ Động Thổ",
        "Văn Khấn Hiếu Hỷ","  Khấn Trong Lễ Tang","  Khấn Lễ Thượng Thọ","  Khấn Khi Cưới Gả","  Khấn Ngày Giỗ Hết","  Khấn Ngày Giỗ Đầu","  Khấn Lễ Cũng Mụ",
        "Các Ngày Tết Trong Năm","  Khấn Chúng Sinh","  Tết Thanh Minh","  Tết Trung Thu","  Tết Trung Nguyên","  Tết Trung Nguyên 1","  Tết Hàn Thực","  Tết Hạ Nguyên","  Tết Đoan Ngọ","  Tết Nguyên Tiêu",
        "Đình, Chùa, Miếu Phủ","  Khấn Thành Hoàng","  Khấn Tại Đền, Đình, Miếu","  Khấn Tại Đền Bà Chúa Kho","  Khấn Tại Chùa","  Khấn Lễ Phật","  Khấn Đức Thánh Trần","  Khấn Đức Thánh Hiền","  Khấn Phật Bà Quan Âm","  Khấn U Minh Giáo Chủ","  Khấn Ban Công Đồng","Cúng Giỗ Gia Tiên","  Khấn Ngày Giỗ Thường","  Khấn Khi Cúng Giỗ","  Khấn Cầu Tự",
        "Văn Khấn Giải Hạn","  Khấn Giải Trừ Bệnh Tật","  Khấn Sao Giải Hạn","  Lễ Giâng Sao Giải Hạn Tết Nguyên Tiêu"
    ]
    var hide = [
        1,0,0,0,0,0,0,0,0,0,
        1,0,0,0,0,0,0,
        1,0,0,0,0,0,0,
        1,0,0,0,0,0,0,
        1,0,0,0,0,0,0,0,0,0,
        1,0,0,0,0,0,0,0,0,0,0,
        1,0,0,0,
        1,0,0,0
    ]
    var title2:[String] = []
    func initTitle(){
        for i in 0..<hide.count{
            if(hide[i] == 1){
                title2.append(titleVanKhan[i])
                print("index:",i)
            }
        }
    }
    func showTitle(min:Int,max:Int){
        title2.removeAll()
        for i in min...max{
            hide[i] = 1
        }
        initTitle()
    }
    func hideTitle(min:Int,max:Int){
        title2.removeAll()
        for i in min...max{
            hide[i] = 0
        }
        initTitle()
    }
    let index = ["Văn Khấn Lễ Tết","Văn Khấn Hàng Tháng","Văn Khấn Gia Trạch","Văn Khấn Hiếu Hỷ","Các Ngày Tết Trong Năm","Đình, Chùa, Miếu Phủ","Cúng Giỗ Gia Tiên","Văn Khấn Giải Hạn"]
    var indexHide = [true,true,true,true,true,true,true,true]
    
    func contain(row:String)->Bool{
        for i in index{
            if(row == i){
                return true
            }
        }
        return false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageBackground.image = UIImage(named: Const.imageBackgrounds[Const.indexBackground])
        initTitle()
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }

}
