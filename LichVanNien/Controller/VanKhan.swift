//
//  VanKhan.swift
//  LichVanNien
//
//  Created by TBM on 6/24/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class VanKhan: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleVanKhan.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellVanKhan", for: indexPath)
        if(contain(row: titleVanKhan[indexPath.row])){
            (cell.viewWithTag(1) as! UILabel).textColor = UIColor.red
            (cell.viewWithTag(1) as! UILabel).font = UIFont.boldSystemFont(ofSize: 17.0)
        }else{
            (cell.viewWithTag(1) as! UILabel).textColor = UIColor.black
            (cell.viewWithTag(1) as! UILabel).font = UIFont.systemFont(ofSize: 17)
        }
        (cell.viewWithTag(1) as! UILabel).text = titleVanKhan[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Const.indexVanKhan = indexPath.row
        print("indexvankhan:",Const.indexVanKhan)
        let vankhan = storyboard?.instantiateViewController(withIdentifier: "chitietvankhan")
        
        self.present(vankhan!, animated: true, completion: nil)
        
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var tableVanKhan: UITableView!
    let titleVanKhan = [
        "Văn Khấn Lễ Tết","  Khấn Tổ Tiên Ngày Tết","  Khấn Thần Linh Ngày Tết",        "  Khấn Tất Niên","  Khấn Giao Thừa Ngoài Trời","  Khấn Giao Thừa Trong Nhà","  Khấn Tạ Năm Mới","  Khấn Ông Táo Chầu Trời","  Lễ Mộ 30 Tết","  Khấn Lễ Thăm Mộ","Văn Khấn Hàng Tháng","  Văn Khấn Tiền Chủ","  Văn Khấn Thánh Sư","  Văn Khấn Thổ Công","  Văn Khấn Thần Tài","  Khấn Mùng 1 Và Ngày Rằm","  Trình Tự Dâng Lễ","Văn Khấn Gia Trạch","  Chuyển Nhà, Sửa Chữa Lớn","  Lễ Tân Gia","  Lễ Nhập Trạch","  Khai Trương Cửa Hàng","  Lễ Hội Hoàn Địa Mạch","  Lễ Động Thổ","Văn Khấn Hiếu Hỷ","  Khấn Trong Lễ Tang","  Khấn Lễ Thượng Thọ","  Khấn Khi Cưới Gả","  Khấn Ngày Giỗ Hết","  Khấn Ngày Giỗ Đầu","  Khấn Lễ Cũng Mụ","Các Ngày Tết Trong Năm","  Khấn Chúng Sinh","  Tết Thanh Minh","  Tết Trung Thu","  Tết Trung Nguyên","  Tết Trung Nguyên 1","  Tết Hàn Thực","  Tết Hạ Nguyên","  Tết Đoan Ngọ","  Tết Nguyên Tiêu","Đình, Chùa, Miếu Phủ","  Khấn Thành Hoàng","  Khấn Tại Đền, Đình, Miếu","  Khấn Tại Đền Bà Chúa Kho","  Khấn Tại Chùa","  Khấn Lễ Phật","  Khấn Đức Thánh Hiền","  Khấn Phật Bà Quan Âm","  Khấn U Minh Giáo Chủ","  Khấn Ban Công Đồng","Cúng Giỗ Gia Tiên","  Khấn Ngày Giỗ Thường","  Khấn Khi Cúng Giỗ","  Khấn Cầu Tự","Văn Khấn Giải Hạn","  Khấn Giải Trừ Bệnh Tật","  Khấn Sao Giải Hạn","  Lễ Giâng Sao Giải Hạn Tết Nguyên Tiêu"
    ]
    var title2:[String]?
    let index = ["Văn Khấn Lễ Tết","Văn Khấn Hàng Tháng","Văn Khấn Gia Trạch","Văn Khấn Hiếu Hỷ","Các Ngày Tết Trong Năm","Đình, Chùa, Miếu Phủ","Cúng Giỗ Gia Tiên","Văn Khấn Giải Hạn"]
    
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
        title2 = titleVanKhan

        // Do any additional setup after loading the view.
    }

}
