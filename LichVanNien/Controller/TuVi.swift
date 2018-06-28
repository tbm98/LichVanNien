//
//  TuVi.swift
//  LichVanNien
//
//  Created by TBM on 6/26/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class TuVi: UIViewController {
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnShare(_ sender: Any) {
        let image:[Any] = [UIApplication.shared.screenShot as Any]
        let activityVC = UIActivityViewController(activityItems: image, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    @IBOutlet weak var viewHomNay: UIView!
    @IBOutlet weak var viewGioTot: UIView!
    @IBOutlet weak var viewNgayTot: UIView!
    @IBOutlet weak var viewAmDuong: UIView!
    
    
    func initTap(){
        viewHomNay.isUserInteractionEnabled = true
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(actionHomNay(tapGestureRecognizer:)))
        viewHomNay.addGestureRecognizer(tapGesture1)

        viewGioTot.isUserInteractionEnabled = true
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(actionGioTot(tapGestureRecognizer:)))
        viewGioTot.addGestureRecognizer(tapGesture2)

        viewNgayTot.isUserInteractionEnabled = true
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(actionNgayTot(tapGestureRecognizer:)))
        viewNgayTot.addGestureRecognizer(tapGesture3)

        viewAmDuong.isUserInteractionEnabled = true
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(actionAmDuong(tapGestureRecognizer:)))
        viewAmDuong.addGestureRecognizer(tapGesture4)
    }
    
    
    @objc func actionHomNay(tapGestureRecognizer: UITapGestureRecognizer) {
        print("hn")
        Const.titleTuVi = "Tử Vi Hôm Nay"
        Const.linkTuVi = "http://tracuu.tuvisomenh.com/xem-ngay-tot-xau"
        show()
        
    }
    @objc func actionGioTot(tapGestureRecognizer: UITapGestureRecognizer) {
        print("gt")
        Const.titleTuVi = "Giờ Tốt Hôm Nay"
        Const.linkTuVi = "http://tracuu.tuvisomenh.com/xem-ngay-tot-xau/xem-gio-tot-trong-ngay"
        show()
    }
    @objc func actionNgayTot(tapGestureRecognizer: UITapGestureRecognizer) {
        Const.titleTuVi = "Ngày Tốt Trong Tháng"
        Const.linkTuVi = "http://tracuu.tuvisomenh.com/xem-ngay-tot-xau/xem-ngay-tot-xau-trong-thang"
        show()
    }
    @objc func actionAmDuong(tapGestureRecognizer: UITapGestureRecognizer) {
        Const.titleTuVi = "Âm Dương Của Ngày"
        Const.linkTuVi = "http://tracuu.tuvisomenh.com/xem-lich/lich-am-duong"
        show()
    }
    
    func show(){
        let chitiettuvi = storyboard?.instantiateViewController(withIdentifier: "chitiettuvi")
        self.present(chitiettuvi!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTap()
        // Do any additional setup after loading the view.
    }
}
