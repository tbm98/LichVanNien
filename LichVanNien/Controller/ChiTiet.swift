//
//  ChiTiet.swift
//  LichVanNien
//
//  Created by TBM on 6/24/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit
import GoogleMobileAds


class ChiTiet: UIViewController ,GADInterstitialDelegate,GADBannerViewDelegate{
    @IBOutlet weak var bot: NSLayoutConstraint!
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        
        bot.constant = (50 as CGFloat).dp
    }
    var mode = 1
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
    
    @IBOutlet weak var naviTitle: UINavigationItem!
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var labelNgayAm: UILabel!
    @IBOutlet weak var labelNgayHoangDao: UILabel!
    @IBOutlet weak var labelGioAm: UILabel!
    @IBOutlet weak var labelGio1: UILabel!
    @IBOutlet weak var labelGio2: UILabel!
    @IBOutlet weak var labelGio3: UILabel!
    @IBOutlet weak var labelGio4: UILabel!
    @IBOutlet weak var labelGio5: UILabel!
    @IBOutlet weak var labelGio6: UILabel!
    @IBOutlet weak var labelTietKhi: UILabel!
    @IBOutlet weak var labelTrucNgay: UILabel!
    @IBOutlet weak var labelViecNenLam: UILabel!
    @IBOutlet weak var labelViecKhongNenLam: UILabel!
    @IBOutlet weak var labelSao: UILabel!
    @IBOutlet weak var labelNguHanh: UILabel!
    @IBOutlet weak var labelConVat: UILabel!
    @IBOutlet weak var labelNen: UILabel!
    @IBOutlet weak var labelKhongNen: UILabel!
    @IBOutlet weak var labelNgoaiLe: UILabel!
    
    var date:Date?
    let calendar = Calendar.current
    var day:Int = 0
    var month:Int = 0
    var year:Int = 0
    
    func initDate(){
        var components = calendar.dateComponents([.year, .month, .day], from: date!)
        day = components.day!
        month = components.month!
        year = components.year!
    }
    var bannerView: GADBannerView!
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoadInterstitial()
        print("dismis")
        mode1()
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
        initDate()
        let time = VietCalendar().minh(d: day, m: month, y: year)
        labelNgayAm.text = "Ngày \(calendar.component(.day, from: time)), tháng \(calendar.component(.month, from: time)), năm \(calendar.component(.year, from: time))"
        if(Const.hoangdao(time: time) == 0){
            labelNgayHoangDao.text = "Hoàng Đạo"
        }else if(Const.hoangdao(time: time) == 1){
            labelNgayHoangDao.text = "Hắc Đạo"
        }else{
            labelNgayHoangDao.text = "Bình Thường"
        }
        print("nhithapbattu:",Const.nhiThapBatTu(time: time)+1)
        let index = Const.nhiThapBatTu(time: time)
        var nhithap:objectNTBT
        if(index<27){
            nhithap = Const.ntbt[index+1]
        }else{
            nhithap = Const.ntbt[index]
        }
        //let nhithap = Const.ntbt[+1]
        labelSao.text = "Sao: \(nhithap.sao)"
        labelNguHanh.text = nhithap.thuoc
        labelConVat.text = nhithap.convat
        labelNen.text = nhithap.nenlam
        labelKhongNen.text = nhithap.khongnen
        labelNgoaiLe.text = nhithap.ngoaile
        let giohoangdao = Const.gioHoangDao(dmy: time)
        labelGio1.text = Const.gio[giohoangdao[0]]
        labelGio2.text = Const.gio[giohoangdao[1]]
        labelGio3.text = Const.gio[giohoangdao[2]]
        labelGio4.text = Const.gio[giohoangdao[3]]
        labelGio5.text = Const.gio[giohoangdao[4]]
        labelGio6.text = Const.gio[giohoangdao[5]]
        let truc = Const.truc[Const.truci(dmy: time)]
        labelTrucNgay.text = truc.truc
        labelViecNenLam.text = truc.nenlam
        labelViecKhongNenLam.text = truc.khongnen
        labelTietKhi.text = Const.TIETKHI[Const.tietKhi(dmy: time)]
        print(giohoangdao)
        
        
        naviTitle.title = "\(Const.thu(date: self.date!)), \(self.day)/\(self.month)/\(self.year)"
        
        
        //
        let canchi = Const.getCanChiLunarDay(dd: calendar.component(.day, from: time), mm: calendar.component(.month, from: time), yy: calendar.component(.year, from: time))
        let tcc = Const.thangcanchi(time: time)
        let ccD = "\(Const.can[tcc[0]]) \(Const.chi[tcc[1]])"
        let ccA = "\(Const.namcanchi(time: time))"
        var canN = canchi[0]
        canN = canN - 2
        if(canN < 0){
            canN = 10 + canN
        }
        
        var chiN = canchi[1]
        //        print("chiN:",chiN)
        chiN = chiN - 4
        if(chiN < 0){
            chiN = 12 + chiN// - 12
        }
        let ccN = "\(Const.can[canN]) \(Const.chi[chiN])"
        print(ccD)
        print(ccA)
//        labelTenNam.text = """
//        \(ccD)
//        \(ccA)
//        """
        let thang = ccD
        let nam = ccA
        let ngay = ccN
        
        let ccH = Const.gioCanChi(hour: Const.calendar.component(.hour, from: Date()), can: canN)
        let gio = "\(Const.can[ccH[0]]) \(Const.chi[ccH[1]])"
        
        labelGioAm.text = "Giờ \(gio), Ngày \(ngay), Tháng \(thang), Năm \(nam)"
        imageBackground.image = UIImage(named: Const.imageBackgrounds[Const.indexBackground])
        bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait
)
        
        addBannerViewToView(bannerView)
        bannerView.adUnitID = Const.bannerId
        bannerView.rootViewController = self
        bannerView.delegate = self
        bannerView.load(GADRequest())
        interstitial = createAndLoadInterstitial()

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
