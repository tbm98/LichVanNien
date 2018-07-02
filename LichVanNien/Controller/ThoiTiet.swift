//
//  ThoiTiet.swift
//  LichVanNien
//
//  Created by TBM on 6/24/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMobileAds

class ThoiTiet: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource,CLLocationManagerDelegate,GADInterstitialDelegate,GADBannerViewDelegate{
    
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        bot.constant = (50 as CGFloat).dp
    }
    
    var mode = 1
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return titleTinh.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return titleTinh[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelTinh.text = titleTinh[row]
        let value = titleTinh[row].replacingOccurrences(of: " ", with: "%20")
        
        print("data:",loadString(path: "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22(\(value))%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"))
        handleData(path: "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22(\(value))%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
        
    }
    
    
    
    @IBOutlet weak var viewThoiTiet: UIView!
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
    @IBAction func btnChonTinh(_ sender: Any) {
        pickerTinh.isHidden = !pickerTinh.isHidden
    }
    @IBOutlet weak var textTinh: UITextField!
    @IBAction func btnTimTinh(_ sender: Any) {
        if(!(textTinh.text?.isEmpty)!){
            let value:String = (textTinh.text?.replacingOccurrences(of: " ", with: "%20"))!
            print("data:",loadString(path: "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22(\(value))%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"))
            handleData(path: "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22(\(value))%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
            
            dismisKeyBoard()
        }else{
            let alertController = UIAlertController(title: "Thông báo", message: "Bạn chưa nhập địa điểm!", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction) in
                print("you've pressed ok")
            }
            
            alertController.addAction(action1)
            self.present(alertController, animated: true, completion: nil)
        }

        
    }
    func dismisKeyBoard(){
        
    }
    @IBOutlet weak var pickerTinh: UIPickerView!
    @IBOutlet weak var labelTinh: UILabel!
    @IBOutlet weak var labelViTri: UILabel!
    @IBOutlet weak var labelNhietDo: UILabel!
    @IBOutlet weak var labelGio: UILabel!
    @IBOutlet weak var labelDoAm: UILabel!
    @IBOutlet weak var labelApSuat: UILabel!
    @IBOutlet weak var labelTamNhin: UILabel!
    
    @IBOutlet weak var labelNgay: UILabel!
    @IBOutlet weak var labelThoiTiet: UILabel!
    @IBOutlet weak var labelThap: UILabel!
    @IBOutlet weak var labelCao: UILabel!
    
    @IBOutlet weak var labelNgay2: UILabel!
    @IBOutlet weak var labelThoiTiet2: UILabel!
    @IBOutlet weak var labelThap2: UILabel!
    @IBOutlet weak var labelCao2: UILabel!
    
    @IBOutlet weak var labelNgay3: UILabel!
    @IBOutlet weak var labelThoiTiet3: UILabel!
    @IBOutlet weak var labelThap3: UILabel!
    @IBOutlet weak var labelCao3: UILabel!
    
    @IBOutlet weak var labelNgay4: UILabel!
    @IBOutlet weak var labelThoiTiet4: UILabel!
    @IBOutlet weak var labelThap4: UILabel!
    @IBOutlet weak var labelCao4: UILabel!
    
    @IBOutlet weak var labelNgay5: UILabel!
    @IBOutlet weak var labelThoiTiet5: UILabel!
    @IBOutlet weak var labelThap5: UILabel!
    @IBOutlet weak var labelCao5: UILabel!
    @IBAction func btnLocation(_ sender: Any) {
        
        
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.requestAlwaysAuthorization()
        // For use when the app is open
        //locationManager.requestWhenInUseAuthorization()
        // If location services is enabled get the users location
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the locaiton accuary here.
            locationManager.startUpdatingLocation()
        }else{
            //khong co location
            
        }
    }

    
    var loadedLocation = false
    var lat:Double = 0.0
    var lng:Double = 0.0
    
    var objecttt:[objectThoiTiet] = []
    var diachi:String = ""
    var nhietdo:String = ""
    var gio:String = ""
    var doam:String = ""
    var apsuat:String = ""
    var tamnhin:String = ""
    @IBOutlet weak var bot: NSLayoutConstraint!
    
    
    let titleTinh = ["An Giang","Ba Ria - Vung Tau","Bac Giang","Bac Kan","Bac Lieu","Bac Ninh","Ben Tre","Binh Đinh","Binh Duong","Binh Phuoc","Binh Thuan","Ca Mau","Cao Bang","Dak Lak","Dak Nong","Dien Bien","Dong Nai","Dong Thap","Gia Lai","Ha Giang","Ha Nam","Ha Tinh","Hai Duong","Hau Giang","Hoa Binh","Hung Yen","Khanh Hoa","Kien Giang","Kon Tum","Lai Chau","Lam Đong","Lang Son","Lao Cai","Long An","Nam Dinh","Nghe An","Ninh Binh","Ninh Thuan","Phu Tho","Quang Binh","Quang Nam","Quang Ngai","Quang Ninh","Quang Tri","Soc Trang","Son La","Tay Ninh","Thai Binh","Thai Nguyen","Thanh Hoa","Thua Thien Hue","Tien Giang","Tra Vinh","Tuyen Quang","Vinh Long","Vinh Phuc","Yen Bai","Phu Yen","Can Tho","Đa Nang","Hai Phong","Ha Noi","TP HCM"]
//        let titleTinh = ["An Giang","Bà Rịa - Vũng Tàu","Bắc Giang","Bắc Kạn","Bạc Liêu","Bắc Ninh","Bến Tre","Bình Định","Bình Dương","Bình Phước","Bình Thuận","Cà Mau","Cao Bằng","Đắk Lắk","Đắk Nông","Điện Biên","Đồng Nai","Đồng Tháp","Gia Lai","Hà Giang","Hà Nam","Hà Tĩnh","Hải Dương","HậuGiang","Hòa Bình","Hưng Yên","Khánh Hòa","Kiên Giang","Kon Tum","Lai Châu","Lâm Đồng","Lạng Sơn","Lào Cai","Long An","Nam Định","Nghệ An","Ninh Bình","Ninh Thuận","Phú Thọ","Quảng Bình","Quảng Nam","Quảng Ngãi","Quảng Ninh","Quảng Trị","Sóc Trăng","Sơn La","Tây Ninh","Thái Bình","Thái Nguyên","Thanh Hóa","Thừa Thiên Huế","Tiền Giang","Trà Vinh","Tuyên Quang","Vĩnh Long|Vĩnh Phúc","Yên Bái","Phú Yên","Cần Thơ","Đà Nẵng","Hải Phòng","Hà Nội","TP HCM"]
    
    
    // Used to start getting the users location
    let locationManager = CLLocationManager()
    
    
    var bannerView: GADBannerView!
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoadInterstitial()
        print("dismis")
        if(mode == 1){
            mode1()
        }else{
            mode2()
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
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(tapGestureRecognizer:)))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        // In this case, we instantiate the banner with desired ad size.
        bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        
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
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard(tapGestureRecognizer: UITapGestureRecognizer) {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
        print("ending")
    }
    
    
    func loadString(path:String) ->String{
        let url = URL(string: path)
        let data = try? String(contentsOf: url!)
        //print("data is \(String(describing: data))")
        return data!
    }
    func converFtoC(f:Int)->Int{
        return (f-32)*5/9
    }
    
    func handleData(path:String){
        
        let url = URL(string: path)
        URLSession.shared.dataTask(with: (url)!, completionHandler: {(data, response, error) -> Void in
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                //print("jsonObj is :",jsonObj)
                let query = jsonObj!.object(forKey: "query") as? [String: Any]
                let result = query!["results"] as! [String: Any]
                let channel = result["channel"] as! [String: Any]
                guard var location: [String: Any] = channel["location"] as? [String : Any] ?? nil else{
                    return
                }
//                do{
//                    location = try channel["location"] as! [String: Any]
//                }catch{
//                    return
//                }
                
                let region:String = location["region"] as! String
                let country:String = location["country"] as! String
                let wind = channel["wind"] as! [String: Any]
                let atmosphere = channel["atmosphere"] as! [String: Any]
                self.diachi = "\(region), \(country)"
                self.doam = atmosphere["humidity"] as! String
                self.gio = wind["speed"] as! String
                self.apsuat = atmosphere["pressure"] as! String
                self.tamnhin = atmosphere["visibility"] as! String
                //self.nhietdo = wind["chill"] as! Int
                let item = channel["item"] as! [String: Any]
                let condition = item["condition"] as! [String: Any]
                self.nhietdo = condition["temp"] as! String
                let forecast = item["forecast"] as! [[String: Any]]
                var index = 0
                var date:String = ""
                var high:String = ""
                var low:String = ""
                var text:String = ""
                for obj in forecast{
                    index = index + 1
                    if(index == 6){
                        break
                    }
                    for item in obj{
                        switch item.key{
                        case "date":
                            date = item.value as! String
                        case "high":
                            high = item.value as! String
                        case "low":
                            low = item.value as! String
                        case "text":
                            text = item.value as! String
                        default:
                            break
                        }
                    }
                    self.objecttt.append(objectThoiTiet(dt: date, h: high, l: low, t: text))
                }
                DispatchQueue.main.async(execute: {
                    self.labelViTri.text = self.diachi
                    self.labelTinh.text = region
                    self.labelNhietDo.text = "\(self.converFtoC(f: Int(self.nhietdo.description)!))°C/\(self.nhietdo.description)°F"
                    self.labelGio.text = "\(self.gio.description) km/h"
                    self.labelDoAm.text = "\(self.doam.description) %"
                    self.labelApSuat.text = "\(self.apsuat.description) mmHg"
                    self.labelTamNhin.text = "\(self.tamnhin.description) km"
                    
                    self.labelNgay.text = "Ngày: \(self.objecttt[0].data)"
                    self.labelThoiTiet.text = "Thời tiết: \(self.objecttt[0].text)"
                    self.labelThap.text = "Nhiệt độ thấp nhất: \(self.converFtoC(f: Int(self.objecttt[0].low)!)) °C"
                    self.labelCao.text = "Nhiệt độ cao nhất: \(self.converFtoC(f: Int(self.objecttt[0].high)!)) °C"
                    
                    self.labelNgay2.text = "Ngày: \(self.objecttt[1].data)"
                    self.labelThoiTiet2.text = "Thời tiết: \(self.objecttt[1].text)"
                    self.labelThap2.text = "Nhiệt độ thấp nhất: \(self.converFtoC(f: Int(self.objecttt[1].low)!)) °C"
                    self.labelCao2.text = "Nhiệt độ cao nhất: \(self.converFtoC(f: Int(self.objecttt[1].high)!)) °C"
                    
                    self.labelNgay3.text = "Ngày: \(self.objecttt[2].data)"
                    self.labelThoiTiet3.text = "Thời tiết: \(self.objecttt[2].text)"
                    self.labelThap3.text = "Nhiệt độ thấp nhất: \(self.converFtoC(f: Int(self.objecttt[2].low)!)) °C"
                    self.labelCao3.text = "Nhiệt độ cao nhất: \(self.converFtoC(f: Int(self.objecttt[2].high)!)) °C"
                    
                    self.labelNgay4.text = "Ngày: \(self.objecttt[3].data)"
                    self.labelThoiTiet4.text = "Thời tiết: \(self.objecttt[3].text)"
                    self.labelThap4.text = "Nhiệt độ thấp nhất: \(self.converFtoC(f: Int(self.objecttt[3].low)!)) °C"
                    self.labelCao4.text = "Nhiệt độ cao nhất: \(self.converFtoC(f: Int(self.objecttt[3].high)!)) °C"
                    
                    self.labelNgay5.text = "Ngày: \(self.objecttt[4].data)"
                    self.labelThoiTiet5.text = "Thời tiết: \(self.objecttt[4].text)"
                    self.labelThap5.text = "Nhiệt độ thấp nhất: \(self.converFtoC(f: Int(self.objecttt[4].low)!)) °C"
                    self.labelCao5.text = "Nhiệt độ cao nhất: \(self.converFtoC(f: Int(self.objecttt[4].high)!)) °C"
                    self.viewThoiTiet.isHidden = false
                })
            }

            }).resume()

    }
    
    //load location
    // Print out the location to the console
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            if(loadedLocation==false){
                loadedLocation=true
                
                print(location.coordinate)
                lat=location.coordinate.latitude
                lng=location.coordinate.longitude
                print("lat:",lat)
                print("lng:",lng)
                //load weather
                print("data:",loadString(path: "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22(\(lat)%2C\(lng))%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"))
                handleData(path: "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22(\(lat)%2C\(lng))%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
            }
        }
    }
    // If we have been deined access give the user the option to change it
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            showLocationDisabledPopUp()
        }
    }
    // Show the popup to the user if we have been deined access
    func showLocationDisabledPopUp() {
        let alertController = UIAlertController(title: "Truy cập vị trí đã bị chặn",
                                                message: "Chúng tôi cần bạn đồng ý cung cấp vị trí",
                                                preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
            if let url = URL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        self.present(alertController, animated: true, completion: nil)
    }

}
