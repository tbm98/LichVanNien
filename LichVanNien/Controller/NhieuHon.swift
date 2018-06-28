//
//  NhieuHonViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class NhieuHon: UIViewController {
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnShare(_ sender: Any) {
        let image:[Any] = [UIApplication.shared.screenShot as Any]
        let activityVC = UIActivityViewController(activityItems: image, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    @IBOutlet weak var viewVanKhan: UIView!
    @IBOutlet weak var viewTuVi: UIView!
    @IBOutlet weak var viewThoiTiet: UIView!
    @IBOutlet weak var viewDanhGia: UIView!
    @IBOutlet weak var viewChiaSe: UIView!
    
    
    @IBOutlet weak var imageBackground: UIImageView!
    
    func setClick(){
        viewVanKhan.isUserInteractionEnabled = true
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(actionVanKhan(tapGestureRecognizer:)))
        viewVanKhan.addGestureRecognizer(tapGesture1)
        
        viewTuVi.isUserInteractionEnabled = true
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(actionTuVi(tapGestureRecognizer:)))
        viewTuVi.addGestureRecognizer(tapGesture2)
        
        viewThoiTiet.isUserInteractionEnabled = true
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(actionThoiTiet(tapGestureRecognizer:)))
        viewThoiTiet.addGestureRecognizer(tapGesture3)
        
        viewDanhGia.isUserInteractionEnabled = true
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(actionDanhGia(tapGestureRecognizer:)))
        viewDanhGia.addGestureRecognizer(tapGesture4)
        
        viewChiaSe.isUserInteractionEnabled = true
        let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(actionChiaSe(tapGestureRecognizer:)))
        viewChiaSe.addGestureRecognizer(tapGesture5)
    }
    
    @objc func actionVanKhan(tapGestureRecognizer: UITapGestureRecognizer) {
        print("van khan")
        let vankhan = (storyboard?.instantiateViewController(withIdentifier: "vk"))!
        
        //UIApplication.topViewController()?.present(vankhan, animated: true, completion: nil)
        self.present(vankhan, animated: true, completion: nil)
        
    }
    @objc func actionTuVi(tapGestureRecognizer: UITapGestureRecognizer) {
        print("tu vi")
        let tuvi = (storyboard?.instantiateViewController(withIdentifier: "tuvi"))!
        
        //UIApplication.topViewController()?.present(vankhan, animated: true, completion: nil)
        self.present(tuvi, animated: true, completion: nil)
    }
    @objc func actionThoiTiet(tapGestureRecognizer: UITapGestureRecognizer) {
        print("thoi tiet")
        let thoitiet:UIViewController = (storyboard?.instantiateViewController(withIdentifier: "thoitiet"))!
        self.present(thoitiet, animated: true, completion: nil)
    }
    @objc func actionDanhGia(tapGestureRecognizer: UITapGestureRecognizer) {
        print("danh gia")
    }
    @objc func actionChiaSe(tapGestureRecognizer: UITapGestureRecognizer) {
        print("chia se")
        let image:[Any] = [UIApplication.shared.screenShot as Any]
        let activityVC = UIActivityViewController(activityItems: image, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setClick()
    }


}
