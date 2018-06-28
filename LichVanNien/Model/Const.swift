//
//  Const.swift
//  LichVanNien
//
//  Created by TBM on 6/22/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import Foundation
import UIKit
class Const{
    public static let imageBackgrounds = ["nen","nen1","nen2","nen3","nen4","nen5","nen6","nen7","nen8","nen9","nen10","nen11","nen12","valentine1","valentine2"]
    public static func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    public static var indexBackground = 0
    public static var indexBackground2 = 0
    public static var indexChamNgon = 0
    public static var indexVanKhan = 0
    public static var date:Date?
    public static var index1 = 0
    public static var index2 = 0
    public static var update = true
    
    private static var chamNgonSource = "Hãy làm tròn mỗi công việc của đời mình như thể đó là công việc cuối cùng (Marc aurele)|Cách khéo nhất để làm vừa lòng ai đó là xin họ lời khuyên (Odove Primex)|Đừng mua thứ hữu ích mà hãy mua thứ cần thiết (Caton Censeur)|Đừng ném lời cho gió, nếu không hay biết gió thổi về đâu (N. Ghenin)|Đừng để đến ngày mai những việc gì anh có thể làm hôm nay (Lord Chesterfield)|Những gì ta cho đi một cách thật lòng thì mãi mãi là của ta (Geoges Granville)|Thiếu thận trọng gây nhiều tai hại hơn thiếu hiểu biết (Franklin)|Hãy suy nghĩ tất cả những gì bạn nói nhưng đừng nói tất cả những gì bạn nghĩ (Delarme)|Con ong được ca tụng vì nó làm việc không phải cho chính mình mà cho tất cả (Saint J.Chrysistome)|Bàn tay tặng đóa hồng bao giờ cũng còn phảng phất mùi thơm (KD)|Đừng bao giờ khiêm tốn với kẻ kiêu căng, cũng đừng bao giờ kiêu căng với người khiêm tốn (Jeffecson)|Sự ngắn gọn là linh hồn của trí khốn sắc sảo (Shakespear)|Đầu hàng cám giỗ là hành động của thú tính, chiến thắng nó mới là con người (Waterstone)|Hãy hiền dịu khoan dung với hết mọi người trừ bản thân mình (Joubert)|Nếu ai nói xấu bạn mà nói đúng thì hãy sửa mình đi. Nếu họ nói bậy thì bạn hãy cười thôi (Epictete)|Mỗi khi khuyên ai bất cứ điều gì thì nên thật vắn tắt (Horace)|Phải biết mở cửa lòng mình trước mới hy vọng mở được lòng người khác (Pasquier Quesnel)|Điều gì anh muốn người ta làm cho anh, thì anh hãy làm cho người ta trước(Kinh Thánh)|Đôi khi phải nhượng bộ mà thừa nhận rằng củ cải là củ lê (Ngạn ngữ Đức)|Muốn uốn cây cong cho thẳng lại, ta uốn cong nó theo chiều ngược lại (Montaigne)|Khuyên răn thay cho giận dữ, mỉm cười thay cho khinh bỉ (Epiquya)|Yêu mọi người, tin vài người và đừng xúc phạm đến ai (Shakespear)|Lý trí có thể mách bảo ta điều phải tránh, còn con tim sẽ chỉ cho ta biết điều phải làm (Joubert)|Cái gì xuất phát từ trái tim sẽ đi đến trái tim (Piêt)|Không có ngày mai nào lại không kết thúc, không có sự đau khổ nào lại không có lối ra (Rsoutheell)|Đi vòng mà đến đích còn hơn đi thẳng mà ngã đau (Tục ngữ Anh)|Điều oái oăm là, nếu bạn không muốn liều mất cái gì thì bạn còn mất nhiều hơn (Erica Jong)|Người ta thường khen chỉ để được khen Từ chối lời khen là muốn được khen gấp hai (La Rochefoucould)|Đừng đọc gì anh không muốn nhớ và đừng nhớ gì anh không định dùng (G. Bleck)|Không hứa bậy nên mình không phụ ai Không tin bừa nên không ai phụ mình (Ngô Hoài Dã)|Hãy học cách sống vượt thành công của người khác (A.Fuirstenbeg)|Thành công chỉ đến khi bạn làm việc tận tâm và luôn nghĩ đến những điều tốt đẹp (A schwarzenegger)|Chưa thử sức thì không bao giờ biết hết năng lực của mình (Goethe)|Bạn phải thực hiện được điều mà bạn nghĩ là mình không thể thực hiện đươc (Eleanor Roosevelt)|Tìm kiếm cơ hội trong mỗi khó khăn là một trong những bí quyết sống tuyệt vời nhất (Maxwell)|Trái đất luôn tròn vì vậy bạn chẳng thể nào nhìn thấy phía cuối con đường đi (Isak Dinesan)|Đừng thấy cái bóng to của mình trên vách mà tưởng mình vĩ đại|Đừng mất thời gian với những kẻ chuyên làm mất thời gian của người khác|không có hạnh phúc nào to lớn bằng cha mẹ thấy con cái mình trưởng thành|Người mất tiền bạc không mất gì cả, mất tình bạn là mất một phần cuộc sống, mất hy vọng là mất tấ cả|Người nào chê ta đúng đó là thầy ta, người nào chê ta sai đó là bạn ta, người nào khen ta không đúng đó là kẻ thù của ta|Tiền là một đầy tớ tốt nhưng là một ông chủ xấu|Đôi khi im lặng trong giây phút chia ly, gieo vào lòng người đi biết bao nỗi nhớ|Sự giàu có của một người tỉ lệ thuận với số công việc anh ta có thể chuyển giao cho người khác (DAVID THOREAU)|Thà thất bại trên lĩnh vực mà mình yêu thích còn hơn là thành công ở những việc mà mình không tha thiết (George Burns)|Hãy học cách lắng nghe, cơ hội trong đời nhiều khi gõ cữa nhà bạn rất khẽ|Có người nằm mơ đến sự thành công trong khi người khác thức dậy và làm việc chăm chỉ vì nó|Người ta ghét bạn chỉ vì họ muốn giống bạn thôi|Đồng tiền như hạt giống nằm trong bàn tay người nắm giữ và sử dụng nó.|Nếu ta không biết đi về đâu, thì sẽ đi mãi mà không bao giờ đến nơi|Sự thù ghét cũng giống như axit, sớm muộn gì rồi nó cũng sẽ ăn mòn cả vật chứa nó|Những kẻ ăn cắp là những kẻ ăn bám vô sỉ trên sức lao động của người khác|Đường đi khó, không khó vì ngăn sông cách núi, mà khó vì lòng người ngại núi e sông. (Nguyễn Bá Hoc)|Thước đo cuộc đời không phải là bạn sống dài hay sống ngắn, mà là sống như thế nào!|Người khôn ăn nói nửa chừng. Để cho kẻ dại nửa mừng, nửa lo.|Thành công là sự cân bằng giữa cuộc sống và công việc|Nụ cười của bạn có thể mang hạnh phúc đến bất cứ ai, dù họ có thể không thích bạn|Sẽ không có thời điểm nào thích hợp cho một sự khởi đầu tốt hơn là ngay từ bây giờ|Hãy lắng nghe nhịp thở của cuộc sống xung quanh để tận hưởng những gì ngọt ngào nhất mà cuộc sống đem lại.|Chỉ có thời gian mới nhận ra ý nghĩa và giá trị đích thực của tình yêu.|Hãy mở rộng tâm hồn để đón nhận hạnh phúc bình dị xung quanh mình.|Khôn cũng chết, dại cũng chết, biết thì sống."
    public static let chamNgon = Const.chamNgonSource.split(separator: "|")
    public static var titleTuVi = ""
    public static var linkTuVi = ""
    
    public static func thu(date:Date)->String{
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day], from: date)
        let day:Int = components.day!
        let month:Int = components.month!
        let year:Int = components.year!
        let n = (day + 2 * month + (3 * ( month + 1 )) / 5 + year + ( year / 4)) % 7
        print(n)
        //let n = (components.day + 2 * components.month + ( 3 * ( components.month + 1 )) / 5 + components.year + (components.year / 4)) % 7
        switch n {
        case 0:
            return "Chủ nhật"
        case 1:
            return "Thứ hai"
        case 2:
            return "Thứ ba"
        case 3:
            return "Thứ tư"
        case 4:
            return "Thứ năm"
        case 5:
            return "Thứ sáu"
        case 6:
            return "Thứ bảy"
        default:
            break
        }
        return "nil"
    }
    
    public static func createDate(day:Int,month:Int,year:Int)->Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        //("\(year)/\(month)/\(day) 00:00")
        let someDateTime = formatter.date(from: "\(year)/\(month)/\(day) 00:00")
        return someDateTime!
    }
    
    
}
extension UIImageView{
    var imageWithFade:UIImage?{
        get{
            return self.image
        }
        set{
            UIView.transition(with: self,
                              duration: 0.5, options: .transitionCrossDissolve, animations: {
                                self.image = newValue
            }, completion: nil)
        }
    }
}
extension UIViewController{
    @objc func swipeAction(swipe:UISwipeGestureRecognizer){
        switch swipe.direction.rawValue {
        case 1:
            print("1")
        case 2:
            print(2)
        case 3:
            print("3")
        case 4:
            print("4")
        default:
            break 
            
        }
    }
}

extension UIApplication {
    class func topViewController(viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(viewController: nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(viewController: selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(viewController: presented)
        }
        return viewController
    }
    var screenShot: UIImage?  {
        return keyWindow?.layer.screenShot
    }
}
extension CALayer {
    
    var screenShot: UIImage?  {
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(frame.size, false, scale)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            let screenshot = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return screenshot
        }
        return nil
    }
}
extension CGFloat {
    /**
     The relative dimension to the corresponding screen size.
     
     //Usage
     let someView = UIView(frame: CGRect(x: 0, y: 0, width: 320.dp, height: 40.dp)
     
     **Warning** Only works with size references from @1x mockups.
     
     */
    var dp: CGFloat {
        return (self / 320) * UIScreen.main.bounds.width
    }
}
