//
//  VK.swift
//  LichVanNien
//
//  Created by TBM on 6/25/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit
import GoogleMobileAds


class VK: UIViewController ,UITableViewDelegate,UITableViewDataSource,GADInterstitialDelegate,GADBannerViewDelegate{
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var mode = 1
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        botnen.constant = (50 as CGFloat).dp
        bottable.constant = (50 as CGFloat).dp
    }
    
    @IBOutlet weak var bottable: NSLayoutConstraint!
    @IBOutlet weak var botnen: NSLayoutConstraint!
    
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
            var index = 0
            for i in 0..<titleVanKhan.count{
                if(tt == titleVanKhan[i]){
                    index = i
                }
            }
            Const.indexVanKhan = indexVanKhan[index]
            showChiTiet()
        }
        tableView.reloadData()
    }
    
    func showChiTiet(){
        Const.countAction = Const.countAction + 1
        mode = 3
        if(Const.countAction >= 5 && (Date().millisecondsSince1970 - Const.timeRepeat > 180000)){
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
                Const.countAction = 0
                Const.timeRepeat = Date().millisecondsSince1970
            } else {
                print("Ad wasn't ready")
                mode3()
            }
            
        }else{
            mode3()
        }

        
    }
    func mode3(){
        let chitietVK = storyboard?.instantiateViewController(withIdentifier: "chitietvankhan")
        self.present(chitietVK!, animated: true, completion: nil)
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnShare(_ sender: Any) {
        Const.countAction = Const.countAction + 1
        mode = 1
        if(Const.countAction >= 5 && (Date().millisecondsSince1970 - Const.timeRepeat > 180000)){
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
                Const.countAction = 0
                Const.timeRepeat = Date().millisecondsSince1970
            } else {
                print("Ad wasn't ready")
                mode1()
            }
            
        }else{
            mode1()
        }
        
       
    }
    func mode1(){
        let image:[Any] = [UIApplication.shared.screenShot as Any]
        let activityVC = UIActivityViewController(activityItems: image, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    fileprivate func rateApp(appId: String) {
        openUrl("itms-apps://itunes.apple.com/us/app/id1253533671")
    }
    fileprivate func openUrl(_ urlString:String) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    @IBAction func btnDanhGia(_ sender: Any) {
        Const.countAction = Const.countAction + 1
        mode = 2
        if(Const.countAction >= 5 && (Date().millisecondsSince1970 - Const.timeRepeat > 180000)){
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
                Const.countAction = 0
                Const.timeRepeat = Date().millisecondsSince1970
                
            } else {
                print("Ad wasn't ready")
                mode2()
            }
            
        }else{
            mode2()
        }
      
       
    }
    func mode2(){
        rateApp(appId: "appid")
        //        guard let url = URL(string: "itms-apps://itunes.apple.com/app/id1253533671") else {
        //            return
        //        }
        //
        //        if #available(iOS 10.0, *) {
        //            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        //        } else {
        //            UIApplication.shared.openURL(url)
        //        }
    }
    

    let titleVanKhan = [
        letet,
        totien,
        thanlinh,
        tatnien,
        gtngoai,
        gttrong,
        ta,
        ongtao,
        lemochap,
        thammo,
        hangthang,
        tienchu,
        thanhsu,
        thocong,
        thantai,
        m1nram,
        ttdangle,
        giatrach,
        chuyennha,
        tangia,
        nhaptrach,
        cuahang,
        diamach,
        dongtho,
        hieuhy,
        letang,
        thuongtho,
        cuoiga,
        giohet,
        giodau,
        cungmu,
        cacngaytettrongnam,
        chungsinh,
        thanhminh,
        trungthu,
        trungnguyen,
        trungnguyen1,
        hanthuc,
        hanguyen,
        doanngo,
        nguyentieu,
        dinhchua,
        thanhhoang,
        mieu,
        chuakho,
        chua,
        phat,
        thanhtran,
        thanhhien,
        quanam,
        uminh,
        congdong,
        giatien,
        thuong,
        cung,
        cautu,
        giaihan,
        benhtat,
        dangsao,
        ledang
    ]
//    let titleVanKhan = [
//        "Văn Khấn Lễ Tết",
//        "  Khấn Tổ Tiên Ngày Tết",
//        "  Khấn Thần Linh Ngày Tết",
//        "  Khấn Tất Niên",
//        "  Khấn Giao Thừa Ngoài Trời",
//        "  Khấn Giao Thừa Trong Nhà",
//        "  Khấn Tạ Năm Mới",
//        "  Khấn Ông Táo Chầu Trời",
//        "  Lễ Mộ 30 Tết",
//        "  Khấn Lễ Thăm Mộ" ,
//        "Văn Khấn Hàng Tháng",
//        "  Văn Khấn Tiền Chủ",
//        "  Văn Khấn Thánh Sư",
//        "  Văn Khấn Thổ Công",
//        "  Văn Khấn Thần Tài",
//        "  Khấn Mùng 1 Và Ngày Rằm",
//        "  Trình Tự Dâng Lễ",
//        "Văn Khấn Gia Trạch",
//        "  Chuyển Nhà, Sửa Chữa Lớn",
//        "  Lễ Tân Gia",
//        "  Lễ Nhập Trạch",
//        "  Khai Trương Cửa Hàng",
//        "  Lễ Hội Hoàn Địa Mạch",
//        "  Lễ Động Thổ",
//        "Văn Khấn Hiếu Hỷ",
//        "  Khấn Trong Lễ Tang" ,
//        "  Khấn Lễ Thượng Thọ",
//        "  Khấn Khi Cưới Gả",
//        "  Khấn Ngày Giỗ Hết",
//        "  Khấn Ngày Giỗ Đầu",
//        "  Khấn Lễ Cũng Mụ",
//        "Các Ngày Tết Trong Năm",
//        "  Khấn Chúng Sinh",
//        "  Tết Thanh Minh",
//        "  Tết Trung Thu",
//        "  Tết Trung Nguyên",
//        "  Tết Trung Nguyên 1",
//        "  Tết Hàn Thực",
//        "  Tết Hạ Nguyên",
//        "  Tết Đoan Ngọ",
//        "  Tết Nguyên Tiêu",
//        "Đình, Chùa, Miếu Phủ",
//        "  Khấn Thành Hoàng",
//        "  Khấn Tại Đền, Đình, Miếu",
//        "  Khấn Tại Đền Bà Chúa Kho",
//        "  Khấn Tại Chùa",
//        "  Khấn Lễ Phật",
//        "  Khấn Đức Thánh Trần",
//        "  Khấn Đức Thánh Hiền",
//        "  Khấn Phật Bà Quan Âm",
//        "  Khấn U Minh Giáo Chủ",
//        "  Khấn Ban Công Đồng",
//        "Cúng Giỗ Gia Tiên",
//        "  Khấn Ngày Giỗ Thường",
//        "  Khấn Khi Cúng Giỗ",
//        "  Khấn Cầu Tự",
//        "Văn Khấn Giải Hạn",
//        "  Khấn Giải Trừ Bệnh Tật",
//        "  Khấn Sao Giải Hạn",
//        "  Lễ dâng Sao Giải Hạn Tết Nguyên Tiêu"
//    ]
    let indexVanKhan = [
        0,
        4,
        10,
        11,
        28,
        29,
        20,
        23,
        25,
        1,
        0,
        5,
        6,
        8,
        9,
        15,
        44,
        0,
        2,
        18,
        24,
        26,
        27,
        34,
        0,
         3,
        17,
        35,
        42,
        43,
        54,
        0,
        39,
        45,
        46,
        47,
        48,
        49,
        50,
        51,
        52,
        0,
        7,
        12,
        13,
        14,
        21,
        30,
        31,
        32,
        33,
        41,
        0,
        16,
        36,
        40,
        0,
        37,
        38,
        53
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
                //print("index:",i)
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
    var bannerView: GADBannerView!
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoadInterstitial()
        print("dismis")
        if(mode == 1){
            mode1()
        }else if(mode == 2){
            mode2()
        }else{
            mode3()
        }
    }
    func createAndLoadInterstitial() -> GADInterstitial {
        var interstitial = GADInterstitial(adUnitID: Const.interstitialId)
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    var interstitial: GADInterstitial!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageBackground.image = UIImage(named: Const.imageBackgrounds[Const.indexBackground])
        initTitle()
        tableView.reloadData()
        bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait
)
        
        addBannerViewToView(bannerView)
        bannerView.adUnitID = Const.bannerId
        bannerView.rootViewController = self
        bannerView.delegate = self
        bannerView.load(GADRequest())
        interstitial = createAndLoadInterstitial()
        // Do any additional setup after loading the view.
    }
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }

}
