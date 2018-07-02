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
    public static let can = [
        "Canh","Tân","Nhâm","Quý","Giáp","Ất","Bính","Đinh","Mậu","Kỷ"
    ]
    public static let chi = [
        "Tý","Sửu","Dần","Mão","Thìn","Tỵ","Ngọ","Mùi","Thân","Dậu","Tuất","Hợi"
    ]
    public static func namcanchi(time:Date)->String {
        var y = Const.calendar.component(.year, from: time)
        let can = y % 10
        var hsc = y % 100
        var tong = 0
        var chi = 0
        var chi1 = [0]
        var chi2 = [0]
        while(y>0){
            tong = tong + y % 10
            y = y / 10
        }
        tong = tong - 1
        tong = tong % 3
        if(tong == 0){
            chi1 = [0,3,6,9]
        }
        if(tong == 1){
            chi1 = [1,4,7,10]
        }
        if(tong == 2){
            chi1 = [2,5,8,11]
        }
        hsc = hsc % 4
        switch hsc {
        case 0:
            chi2 = [0,4,8]
        case 1:
            chi2 = [1,5,9]
        case 2:
            chi2 = [2,6,10]
        case 3:
            chi2 = [3,7,11]
        default:
            break
        }
        for c1 in chi1{
            for c2 in chi2{
                if(c1 == c2){
                    chi = c1
                    break
                }
            }
        }
        return "\(Const.can[can]) \(Const.chi[chi])"
    }
    public static func thangcanchi(time:Date)->[Int]{
        let y = Const.calendar.component(.year, from: time)
        let m = Const.calendar.component(.month, from: time)
        let can = y%10
        if([4,9].contains(can)){
            switch m{
            case 1:
                return [6,2]
            case 2:
                return [7,3]
            case 3:
                return [8,4]
            case 4:
                return [9,5]
            case 5:
                return [0,6]
            case 6:
                return [1,7]
            case 7:
                return [2,8]
            case 8:
                return [3,9]
            case 9:
                return [4,10]
            case 10:
                return [5,11]
            case 11:
                return [6,0]
            case 12:
                return [7,1]
            default:
                break
            }
        }
        if([0,5].contains(can)){
            switch m{
            case 1:
                return [8,2]
            case 2:
                return [9,3]
            case 3:
                return [0,4]
            case 4:
                return [1,5]
            case 5:
                return [2,6]
            case 6:
                return [3,7]
            case 7:
                return [4,8]
            case 8:
                return [5,9]
            case 9:
                return [6,10]
            case 10:
                return [7,11]
            case 11:
                return [8,0]
            case 12:
                return [9,1]
            default:
                break
            }
        }
        if([1,6].contains(can)){
            switch m{
            case 1:
                return [0,2]
            case 2:
                return [1,3]
            case 3:
                return [2,4]
            case 4:
                return [3,5]
            case 5:
                return [4,6]
            case 6:
                return [5,7]
            case 7:
                return [6,8]
            case 8:
                return [7,9]
            case 9:
                return [8,10]
            case 10:
                return [9,11]
            case 11:
                return [0,0]
            case 12:
                return [1,1]
            default:
                break
            }
        }
        if([2,7].contains(can)){
            switch m{
            case 1:
                return [2,2]
            case 2:
                return [3,3]
            case 3:
                return [4,4]
            case 4:
                return [5,5]
            case 5:
                return [6,6]
            case 6:
                return [7,7]
            case 7:
                return [8,8]
            case 8:
                return [9,9]
            case 9:
                return [0,10]
            case 10:
                return [1,11]
            case 11:
                return [2,0]
            case 12:
                return [3,1]
            default:
                break
            }
        }
        if([3,8].contains(can)){
            switch m{
            case 1:
                return [4,2]
            case 2:
                return [5,3]
            case 3:
                return [6,4]
            case 4:
                return [7,5]
            case 5:
                return [8,6]
            case 6:
                return [9,7]
            case 7:
                return [0,8]
            case 8:
                return [1,9]
            case 9:
                return [2,10]
            case 10:
                return [3,11]
            case 11:
                return [4,0]
            case 12:
                return [5,1]
            default:
                break
            }
        }
        return []
        
    }
    public static func gioCanChi(hour:Int,can:Int)->[Int]{
        var canchi = [0]
        if([4,9].contains(can)){
            canchi = [4,0]
        }
        if([0,5].contains(can)){
            canchi = [6,0]
        }
        if([1,6].contains(can)){
            canchi = [8,0]
        }
        if([2,7].contains(can)){
            canchi = [0,0]
        }
        if([3,8].contains(can)){
            canchi = [2,0]
        }
        var can = canchi[0]
        var chi = canchi[1]
        var bac:Int = 0
        if(hour%2==0){
            bac = hour/2
        }
        if(hour%2==1){
            bac = hour/2 + 1
        }
        bac = bac - 1
        can = can + bac - 1
        can = can % 10
        chi = chi + bac + 1
        chi = chi % 12
        return [can,chi]
    }
    public static var indexBackground = 0
    public static var indexChamNgon = 0
    public static var indexVanKhan = 0
    public static var date:Date?
    public static var dateThang:Date?
    public static var calendar = Calendar.current
    public static var update = true
    public static var id:Int = 0
    
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
    
    public static let ntbt = [
        objectNTBT(sao: "Giác", convat: "Tướng tinh con Giao Long, chủ trị ngày thứ 5", thuoc: "Mộc", nenlam: "Tạo tác mọi việc đều đặng vinh xương, tấn lợi. Hôn nhân cưới gã sanh con quý. Công danh khoa cử cao thăng, đỗ đạt", khongnen: "Chôn cất hoạn nạn 3 năm. Sửa chữa hay xây đắp mộ phần ắt có người chết. Sanh con nhằm ngày có Sao Giác khó nuôi, nên lấy tên Sao mà đặt tên cho nó mới an toàn. Dùng tên sao của năm hay của tháng cũng được", ngoaile: """
Sao Giác trúng ngày Dần là Đăng Viên được ngôi cao cả, mọi sự tốt đẹp.
            Sao Giác trúng ngày Ngọ là Phục Đoạn Sát: rất Kỵ chôn cất, xuất hành, thừa kế, chia lãnh gia tài, khởi công lò nhuộm lò gốm. NHƯNG Nên dứt vú trẻ em, xây tường, lấp hang lỗ, làm cầu tiêu, kết dứt điều hung hại.
            Sao Giác trúng ngày Sóc là Diệt Một Nhật: Đại Kỵ đi thuyền, và cũng chẳng nên làm rượu, lập lò gốm lò nhuộm, vào làm hành chánh, thừa kế
"""),
        objectNTBT(sao: "Cang", convat: "Tướng tinh con Rồng , chủ trị ngày thứ 6", thuoc: "Kim", nenlam: "Cắt may áo màn (sẽ có lộc ăn)", khongnen: "Chôn cất bị Trùng tang. Cưới gã e phòng không giá lạnh. Tranh đấu kiện tụng lâm bại. Khởi dựng nhà cửa chết con đầu. 10 hoặc 100 ngày sau thì gặp họa, rồi lần lần tiêu hết ruộng đất, nếu làm quan bị cách chức. Sao Cang thuộc Thất Sát Tinh, sanh con nhằm ngày này ắt khó nuôi, nên lấy tên của Sao mà đặt cho nó thì yên lành", ngoaile: """
Sao Cang ở nhằm ngày Rằm là Diệt Một Nhật: Cử làm rượu, lập lò gốm lò nhuộm, vào làm hành chánh, thừa kế sự nghiệp, thứ nhất đi thuyền chẳng khỏi nguy hại ( vì Diệt Một có nghĩa là chìm mất ).
            Sao Cang tại Hợi, Mẹo, Mùi trăm việc đều tốt. Thứ nhất tại Mùi.
"""),
        objectNTBT(sao: "Đê", convat: "Tướng tinh con Lạc Đà, chủ trị ngày thứ 7", thuoc: "Thổ", nenlam: "Sao Đê Đại Hung , không cò việc chi hạp với nó", khongnen: "Khởi công xây dựng, chôn cất, cưới gã, xuất hành kỵ nhất là đường thủy, sanh con chẳng phải điềm lành nên làm Âm Đức cho nó. Đó chỉ là các việc Đại Kỵ, các việc khác vẫn kiêng cử.", ngoaile: "Tại Thân, Tý, Thìn trăm việc đều tốt, nhưng Thìn là tốt hơn hết vì Sao Đê Đăng Viên tại Thìn."),
        objectNTBT(sao: "Phòng ", convat: "Tướng tinh con Thỏ , chủ trị ngày Chủ nhật", thuoc: "Thái Dương", nenlam: "Khởi công tạo tác mọi việc đều tốt , thứ nhất là xây dựng nhà , chôn cất , cưới gã , xuất hành , đi thuyền , mưu sự , chặt cỏ phá đất , cắt áo.", khongnen: " Sao Phòng là Đại Kiết Tinh, không kỵ việc chi cả", ngoaile: """
Tại Đinh Sửu và Tân Sửu đều tốt, tại Dậu càng tốt hơn, vì Sao Phòng Đăng Viên tại Dậu.
                Trong 6 ngày Kỷ Tị, Đinh Tị, Kỷ Dậu, Quý Dậu, Đinh Sửu, Tân Sửu thì Sao Phòng vẫn tốt với các việc khác, ngoại trừ chôn cất là rất kỵ. Sao Phòng nhằm ngày Tị là Phục Đoạn Sát: chẳng nên chôn cất, xuất hành, các vụ thừa kế, chia lãnh gia tài, khởi công làm lò nhuộm lò gốm. NHƯNG Nên dứt vú trẻ em, xây tường, lấp hang lỗ, làm cầu tiêu, kết dứt điều hung hại.
"""),
        objectNTBT(sao: "Tâm", convat: "Tướng tinh con chồn, chủ trị ngày thứ 2.", thuoc: "Thái Âm", nenlam: "Tạo tác việc chi cũng không hạp với Hung tú này", khongnen: "Khởi công tạo tác việc chi cũng không khỏi hại, thứ nhất là xây cất, cưới gã, chôn cất, đóng giường, lót giường, tranh tụng", ngoaile: "Ngày Dần Sao Tâm Đăng Viên, có thể dùng các việc nhỏ."),
        objectNTBT(sao: "Vĩ ", convat: "tướng tinh con cọp, chủ trị ngày thứ 3", thuoc: "Hỏa", nenlam: "Mọi việc đều tốt , tốt nhất là các vụ khởi tạo , chôn cất , cưới gã , xây cất , trổ cửa , đào ao giếng , khai mương rạch , các vụ thủy lợi , khai trương , chặt cỏ phá đất.", khongnen: "Đóng giường , lót giường, đi thuyền.", ngoaile: " Tại Hợi, Mẹo, Mùi Kỵ chôn cất. Tại Mùi là vị trí Hãm Địa của Sao Vỹ. Tại Kỷ Mẹo rất Hung, còn các ngày Mẹo khác có thể tạm dùng được"),
        objectNTBT(sao: "Cơ", convat: "Tướng tinh con Beo , chủ trị ngày thứ 4", thuoc: "Thủy", nenlam: "Khởi tạo trăm việc đều tốt, tốt nhất là chôn cất, tu bổ mồ mã, trổ cửa, khai trương, xuất hành, các vụ thủy lợi ( như tháo nước, đào kinh, khai thông mương rảnh...).", khongnen: "Đóng giường , lót giường, đi thuyền.", ngoaile: "Tại Thân, Tý, Thìn trăm việc kỵ, duy tại Tý có thể tạm dùng. Ngày Thìn Sao Cơ Đăng Viên lẽ ra rất tốt nhưng lại phạm Phục Đoạn. Phạm Phục Đoạn thì kỵ chôn cất, xuất hành, các vụ thừa kế, chia lãnh gia tài, khởi công làm lò nhuộm lò gốm ; NHƯNG nên dứt vú trẻ em, xây tường, lấp hang lỗ, làm cầu tiêu, kết dứt điều hung hại."),
        objectNTBT(sao: "Đẩu", convat: "Tướng tinh con cua , chủ trị ngày thứ 5.", thuoc: "Mộc", nenlam: " Khởi tạo trăm việc đều tốt, tốt nhất là xây đắp hay sửa chữa phần mộ, trổ cửa, tháo nước, các vụ thủy lợi, chặt cỏ phá đất, may cắt áo mão, kinh doanh, giao dịch, mưu cầu công danh", khongnen: " Rất kỵ đi thuyền. Con mới sanh đặt tên nó là Đẩu, Giải, Trại hoặc lấy tên Sao của năm hay tháng hiện tại mà đặt tên cho nó dễ nuôi.", ngoaile: "Tại Tị mất sức. Tại Dậu tốt. Ngày Sửu Đăng Viên rất tốt nhưng lại phạm Phục Đoạn. Phạm Phục Đoạn thì kỵ chôn cất, xuất hành, thừa kế, chia lãnh gia tài, khởi công làm lò nhuộm lò gốm ; NHƯNG nên dứt vú trẻ em, xây tường, lấp hang lỗ, làm cầu tiêu, kết dứt điều hung hại."),
        objectNTBT(sao: "Ngưu", convat: "Tướng tinh con trâu , chủ trị ngày thứ 6", thuoc: "Kim", nenlam: "Đi thuyền, cắt may áo mão", khongnen: " Khởi công tạo tác việc chi cũng hung hại. Nhất là xây cất nhà, dựng trại, cưới gã, trổ cửa, làm thủy lợi, nuôi tằm, gieo cấy, khai khẩn, khai trương, xuất hành đường bộ", ngoaile: """
Ngày Ngọ Đăng Viên rất tốt. Ngày Tuất yên lành. Ngày Dần là Tuyệt Nhật, chớ động tác việc chi, riêng ngày Nhâm Dần dùng được. Trúng ngày 14 ÂL là Diệt Một Sát, cử: làm rượu, lập lò nhuộm lò gốm, vào làm hành chánh, thừa kế sự nghiệp, kỵ nhất là đi thuyền chẳng khỏi rủi ro.
            Sao Ngưu là 1 trong Thất sát Tinh, sanh con khó nuôi, nên lấy tên Sao của năm, tháng hay ngày mà đặt tên cho trẻ và làm việc Âm Đức ngay trong tháng sanh nó mới mong nuôi khôn lớn được
"""),
        objectNTBT(sao: "Nữ", convat: "Tướng tinh con dơi , chủ trị ngày thứ 7.", thuoc: "Thổ", nenlam: "Kết màn, may áo", khongnen: " Khởi công tạo tác trăm việc đều có hại, hung hại nhất là trổ cửa, khơi đường tháo nước, chôn cất, đầu đơn kiện cáo", ngoaile: "Tại Hợi Mẹo Mùi đều gọi là đường cùng. Ngày Quý Hợi cùng cực đúng mức vì là ngày chót của 60 Hoa giáp. Ngày Hợi tuy Sao Nữ Đăng Viên song cũng chẳng nên dùng. Ngày Mẹo là Phục Đoạn Sát, rất kỵ chôn cất, xuất hành, thừa kế sự nghiệp, chia lãnh gia tài, khởi công làm lò nhuộm lò gốm ; NHƯNG nên dứt vú trẻ em, xây tường, lấp hang lỗ, làm cầu tiêu, kết dứt điều hung hại."),
        objectNTBT(sao: "Hư", convat: "Tướng tinh con chuột , chủ trị ngày chủ nhật", thuoc: "Thái Dương", nenlam: "Hư có nghĩa là hư hoại, không có việc chi hợp với Sao Hư", khongnen: "Khởi công tạo tác trăm việc đều không may, thứ nhất là xây cất nhà cửa, cưới gã, khai trương, trổ cửa, tháo nước, đào kinh rạch", ngoaile: """
 Gặp Thân, Tý, Thìn đều tốt, tại Thìn Đắc Địa tốt hơn hết. Hạp với 6 ngày Giáp Tý, Canh Tý, Mậu Thân, Canh Thân, Bính Thìn, Mậu Thìn có thể động sự. Trừ ngày Mậu Thìn ra, còn 5 ngày kia kỵ chôn cất.
            Gặp ngày Tý thì Sao Hư Đăng Viên rất tốt, nhưng lại phạm Phục Đoạn Sát: Kỵ chôn cất, xuất hành, thừa kế, chia lãnh gia tài sự nghiệp, khởi công làm lò nhuộm lò gốm, NHƯNg nên dứt vú trẻ em, xây tường, lấp hang lỗ, làm cầu tiêu, kết dứt điều hung hại.
            Gặp Huyền Nhật là những ngày 7, 8 , 22, 23 ÂL thì Sao Hư phạm Diệt Một: Cử làm rượu, lập lò gốm lò nhuộm, vào làm hành chánh, thừa kế, thứ nhất là đi thuyền ắt chẳng khỏi rủi ro.
            Gặp Thân, Tý, Thìn đều tốt, tại Thìn Đắc Địa tốt hơn hết. Hạp với 6 ngày Giáp Tý, Canh Tý, Mậu Thân, Canh Thân, Bính Thìn, Mậu Thìn có thể động sự. Trừ ngày Mậu Thìn ra, còn 5 ngày kia kỵ chôn cất.
"""),
        objectNTBT(sao: "Nguy", convat: "Tứơng tinh con chim én, chủ trị ngày thứ 2", thuoc: "Thái Âm", nenlam: " Chôn cất rất tốt, lót giường bình yên", khongnen: " Dựng nhà, trổ cửa, gác đòn đông, tháo nước, đào mương rạch, đi thuyền.", ngoaile: "Tại Tị, Dậu, Sửu trăm việc đều tốt, tại Dậu tốt nhất. Ngày Sửu Sao Nguy Đăng Viên: tạo tác sự việc được quý hiển."),
        objectNTBT(sao: "Thất", convat: " Tướng tinh con heo , chủ trị ngày thứ 3", thuoc: "Hỏa", nenlam: " Khởi công trăm việc đều tốt. Tốt nhất là xây cất nhà cửa, cưới gã, chôn cất, trổ cửa, tháo nước, các việc thủy lợi, đi thuyền, chặt cỏ phá đất", khongnen: "Sao thất Đại Kiết không có việc chi phải cử", ngoaile: """
Tại Dần, Ngọ, Tuất nói chung đều tốt, ngày Ngọ Đăng viên rất hiển đạt.
            Ba ngày Bính Dần, Nhâm Dần, Giáp Ngọ rất nên xây dựng và chôn cất, song những ngày Dần khác không tốt. Vì sao Thất gặp ngày Dần là phạm Phục Đoạn Sát ( kiêng cữ như trên ).
"""),
        objectNTBT(sao: "Bích", convat: "Tướng tinh con rái cá , chủ trị ngày thứ 4", thuoc: "Thủy", nenlam: "Khởi công tạo tác việc chi cũng tốt. Tốt nhất là xây cất nhà, cưới gã, chôn cất, trổ cửa, dựng cửa, tháo nước, các vụ thuỷ lợi, chặt cỏ phá đất, cắt áo thêu áo, khai trương, xuất hành, làm việc thiện ắt Thiện quả tới mau hơn.", khongnen: "Sao Bích toàn kiết, không có việc chi phải kiêng cử", ngoaile: "Tại Hợi Mẹo Mùi trăm việc kỵ , thứ nhất trong Mùa Đông. Riêng ngày Hợi Sao Bích Đăng Viên nhưng phạm Phục Đọan Sát ( Kiêng cữ như trên )."),
        objectNTBT(sao: "Khuê ", convat: "Tướng tinh con chó sói, chủ trị ngày thứ 5", thuoc: "Mộc", nenlam: " Tạo dựng nhà phòng , nhập học , ra đi cầu công danh , cắt áo.", khongnen: "Chôn cất , khai trương , trổ cửa dựng cửa , khai thông đường nước , đào ao móc giếng , thưa kiện , đóng giường lót giường", ngoaile: """
Sao Khuê là 1 trong Thất Sát Tinh, nếu đẻ con nhằm ngày này thì nên lấy tên Sao Khuê hay lấy tên Sao của năm tháng mà đặt cho trẻ dễ nuôi.
            Sao Khuê Hãm Địa tại Thân: Văn Khoa thất bại.
            Tại Ngọ là chỗ Tuyệt gặp Sanh, mưu sự đắc lợi, thứ nhất gặp Canh Ngọ.
            Tại Thìn tốt vừa vừa.
"""),
        objectNTBT(sao: "Lâu", convat: "Tướng tinh con chó , chủ trị ngày thứ 6", thuoc: "Kim", nenlam: " Khởi công mọi việc đều tốt . Tốt nhất là dựng cột, cất lầu, làm dàn gác, cưới gã, trổ cửa dựng cửa, tháo nước hay các vụ thủy lợi, cắt áo.", khongnen: "Đóng giường , lót giường, đi đường thủy", ngoaile: """
Tại Ngày Dậu Đăng Viên : Tạo tác đại lợi.
            Tại Tị gọi là Nhập Trù rất tốt.
            Tại Sửu tốt vừa vừa.
            Gặp ngày cuối tháng thì Sao Lâu phạm Diệt Một: rất kỵ đi thuyền, cữ làm rượu, lập lò gốm lò nhuộm, vào làm hành chánh, thừa kế sự nghiệp.
"""),
        objectNTBT(sao: "Vị", convat: "Tướng tinh con chim trĩ , củ trị ngày thứ 7", thuoc: "Thổ", nenlam: "Khởi công tạo tác việc chi cũng lợi. Tốt nhất là xây cất, cưới gã, chôn cất, chặt cỏ phá đất, gieo trồng, lấy giống.", khongnen: "Đi thuyền", ngoaile: """
 Sao Vị mất chí khí tại Dần, thứ nhất tại Mậu Dần, rất là Hung, chẳng nên cưới gã, xây cất nhà cửa.
            Tại Tuất Sao Vị Đăng Viên nên mưu cầu công danh, nhưng cũng phạm Phục Đoạn ( kiêng cữ như các mục trên ).
"""),
        objectNTBT(sao: "Mão", convat: "Tướng tinh con gà , chủ trị ngày chủ nhật", thuoc: "Thái dương", nenlam: "Xây dựng , tạo tác", khongnen: "Chôn Cất ( ĐẠI KỴ ), cưới gã, trổ cửa dựng cửa, khai ngòi phóng thủy, khai trương, xuất hành, đóng giường lót giường. Các việc khác cũng không hay.", ngoaile: """
Tại Mùi mất chí khí.
            Tại Ất Mẹo và Đinh Mẹo tốt, Ngày Mẹo Đăng Viên cưới gã tốt, nhưng ngày Quý Mẹo tạo tác mất tiền của.
            Hạp với 8 ngày: Ất Mẹo, Đinh Mẹo, Tân Mẹo, Ất Mùi, Đinh Mùi, Tân Mùi, Ất Hợi, Tân Hợi.
"""),
        objectNTBT(sao: "Tất", convat: "Tướng tinh con quạ, chủ trị ngày thứ 2", thuoc: "Thái âm", nenlam: "Khởi công tạo tác việc chi cũng tốt. Tốt nhất là chôn cất, cưới gã, trổ cửa dựng cửa, đào kinh, tháo nước, khai mương, móc giếng, chặt cỏ phá đất. Những việc khác cũng tốt như làm ruộng, nuôi tằm, khai trương, xuất hành, nhập học", khongnen: "Đi thuyền", ngoaile: """
Tại Thân, Tý, Thìn đều tốt.
            Tại Thân hiệu là Nguyệt Quải Khôn Sơn, trăng treo đầu núi Tây Nam, rất là tốt. Lại thên Sao tất Đăng Viên ở ngày Thân, cưới gã và chôn cất là 2 điều ĐẠI KIẾT.
"""),
        objectNTBT(sao: "Chủy", convat: "Tướng tinh con khỉ, chủ trị ngày thứ 3", thuoc: "Hỏa", nenlam: "Không có sự việc chi hợp với Sao Chủy", khongnen: " Khởi công tạo tác việc chi cũng không tốt. KỴ NHẤT là chôn cất và các vụ thuộc về chết chôn như sửa đắp mồ mả, làm sanh phần (làm mồ mã để sẵn), đóng thọ đường (đóng hòm để sẵn).", ngoaile: " Tại tị bị đoạt khí, Hung càng thêm hung. Tại dậu rất tốt, vì Sao Chủy Đăng Viên ở Dậu, khởi động thăng tiến. Nhưng cũng phạm Phục Đoạn Sát. Tại Sửu là Đắc Địa, ắt nên. Rất hợp với ngày Đinh sửu và Tân Sửu, tạo tác Đại Lợi, chôn cất Phú Quý song toàn."),
        objectNTBT(sao: "Sâm ", convat: "Tướng tinh con vượn , chủ trị ngày thứ 4", thuoc: "Thủy", nenlam: " Khởi công tạo tác nhiều việc tốt như : xây cất nhà, dựng cửa trổ cửa, nhập học, đi thuyền, làm thủy lợi, tháo nước đào mương.", khongnen: "Cưới gã, chôn cất, đóng giường lót giường, kết bạn.", ngoaile: "Ngày Tuất Sao sâm Đăng Viên, nên phó nhậm, cầu công danh hiển hách."),
        objectNTBT(sao: "Tỉnh", convat: "Tướng tinh con dê trừu, chủ trị ngày thứ 5", thuoc: "Mộc", nenlam: "Tạo tác nhiều việc tốt như xây cất, trổ cửa dựng cửa, mở thông đường nước, đào mương móc giếng, nhậm chức, nhập học, đi thuyền.", khongnen: "Chôn cất, tu bổ phần mộ, làm sanh phần, đóng thọ đường.", ngoaile: "Tại Hợi, Mẹo, Mùi trăm việc tốt. Tại Mùi là Nhập Miếu, khởi động vinh quang."),
        objectNTBT(sao: "Quỷ", convat: "Tướng tinh con dê , chủ trị ngày thứ 6", thuoc: "Kim", nenlam: "Chôn cất, chặt cỏ phá đất, cắt áo", khongnen: "cử:Khởi tạo việc chi cũng hại. Hại nhất là xây cất nhà, cưới gã, trổ cửa dựng cửa, tháo nước, đào ao giếng, động đất, xây tường, dựng cột.", ngoaile: """
 Ngày Tý Đăng Viên thừa kế tước phong tốt, phó nhiệm may mắn. Ngày Thân là Phục Đoạn Sát kỵ chôn cất, xuất hành, thừa kế, chia lãnh gia tài, khởi công lập lò gốm lò nhuộm; NHƯNG nên dứt vú trẻ em, xây tường, lấp hang lỗ, làm cầu tiêu, kết dứt điều hung hại.
            Nhằm ngày 16 ÂL là ngày Diệt Một kỵ làm rượu, lập lò gốm lò nhuộm, vào làm hành chánh, kỵ nhất đi thuyền.
"""),
        objectNTBT(sao: "Liễu", convat: "Tướng tinh con gấu ngựa , chủ trị ngày thứ 7.", thuoc: "Thổ", nenlam: " Không có việc chi hạp với Sao Liễu.", khongnen: "Khởi công tạo tác việc chi cũng hung hại. Hung hại nhất là chôn cất, xây đắp, trổ cửa dựng cửa, tháo nước, đào ao lũy, làm thủy lợi", ngoaile: "Tại Ngọ trăm việc tốt. Tại Tị Đăng Viên: thừa kế và lên quan lãnh chức là 2 điều tốt nhất. Tại Dần, Tuất rất kỵ xây cất và chôn cất : Rất suy vi."),
        objectNTBT(sao: "Tinh", convat: "Tướng tinh con ngựa , chủ trị ngày chủ nhật", thuoc: "Thái dương", nenlam: " Xây dựng phòng mới", khongnen: "Chôn cất, cưới gã, mở thông đường nước.", ngoaile: """
Sao Tinh là 1 trong Thất Sát Tinh, nếu sanh con nhằm ngày này nên lấy tên Sao đặt tên cho trẻ để dễ nuôi, có thể lấy tên sao của năm, hay sao của tháng cũng được. Tại Dần Ngọ Tuất đều tốt, tại Ngọ là Nhập Miếu, tạo tác được tôn trọng. Tại Thân là Đăng Giá ( lên xe ): xây cất tốt mà chôn cất nguy.
            Hạp với 7 ngày: Giáp Dần, Nhâm Dần, Giáp Ngọ, Bính Ngọ, Mậu Ngọ, Bính Tuất, Canh Tuất.
"""),
        objectNTBT(sao: "Trương", convat: "Tướng tinh con nai , chủ trị ngày thứ 2", thuoc: "Thái âm", nenlam: " Khởi công tạo tác trăm việc tốt, tốt nhất là xây cất nhà, che mái dựng hiên, trổ cửa dựng cửa, cưới gã, chôn cất, làm ruộng, nuôi tằm, đặt táng kê gác, chặt cỏ phá đất, cắt áo, làm thuỷ lợi.", khongnen: "Sửa hoặc làm thuyền chèo, đẩy thuyền mới xuống nước.", ngoaile: "Tại Hợi, Mẹo, Mùi đều tốt. Tại Mùi Đăng viên rất tốt nhưng phạm Phục Đoạn."),
        objectNTBT(sao: "Dực", convat: "Tướng tinh con rắn , chủ trị ngày thứ 3", thuoc: "Hỏa", nenlam: "Cắt áo sẽ đước tiền tài.", khongnen: " Chôn cất, cưới gã, xây cất nhà, đặt táng kê gác, gác đòn dông, trổ cửa gắn cửa, các vụ thủy lợi.", ngoaile: " Tại Thân, Tý, Thìn mọi việc tốt. Tại Thìn Vượng Địa tốt hơn hết. Tại Tý Đăng Viên nên thừa kế sự nghiệp, lên quan lãnh chức."),
        objectNTBT(sao: "Chẩn", convat: "tướng tinh con giun, chủ trị ngày thứ 4.", thuoc: "Thủy", nenlam: "Khởi công tạo tác mọi việc tốt lành, tốt nhất là xây cất lầu gác, chôn cất, cưới gã. Các việc khác cũng tốt như dựng phòng, cất trại, xuất hành, chặt cỏ phá đất.", khongnen: "Đi thuyền", ngoaile: "Tại Tị Dậu Sửu đều tốt. Tại Sửu Vượng Địa, tạo tác thịnh vượng. Tại Tị Đăng Viên là ngôi tôn đại, mưu động ắt thành danh."),
        

    ]
    public static let truc = [
        objectTruc(truc: "Trực Kiến", nenlam: "Xuất hành đặng lợi , sanh con rất tốt", khongnen: """
 Động đất ban nền , đắp nền , lót giường , vẽ họa chụp ảnh , lên quan nhậm chức , nạp lễ cầu thân , vào làm hành chánh , dâng nạp
            đơn  sớ , mở kho vựa , đóng thọ dưỡng sanh
"""),
        objectTruc(truc: "Trực Trừ", nenlam: "Động đất , ban nền đắp nền , thờ cúng Táo Thần , cầu thầy chữa bệnh bằng cách mổ xẻ hay châm cứu , hốt thuốc , xả tang , khởi công làm lò nhuộm lò gốm , nữ nhân khởi đầu uống thuốc", khongnen: "Đẻ con nhằm Trực Trừ khó nuôi , nên làm Âm Đức cho nó , nam nhân kỵ khời đầu uống thuốc"),
        objectTruc(truc: "Trực Mãn", nenlam: "Xuất hành , đi thuyền , cho vay , thâu nợ , mua hàng , bán  hàng , đem ngũ cốc vào kho , đặt táng kê gác , gác đòn đông , sửa chữa kho vựa , đặt yên chỗ máy dệt , nạp nô tỳ , vào học kỹ nghệ , làm chuồng gà ngỗng vịt", khongnen: "lên quan lãnh chức , uống thuốc , vào làm hành chánh , dâng nạp đơn sớ"),
        objectTruc(truc: "Trực Bình", nenlam: " Đem ngũ cốc vào kho , đặt táng , gắn cửa , kê gác , gác đòn đông , đặt yên chỗ máy dệt , sửa hay làm thuyền chèo , đẩy thuyền mới  xuống nước , các vụ bồi đắp thêm ( như bồi bùn , đắp đất , lót đá , xây bờ kè...)", khongnen: "Lót giường đóng giường , thừa kế tước phong  hay thừa kế sự nghiệp , các vụ làm cho khuyết thủng ( như đào mương ,  móc giếng , xả nước...)"),
        objectTruc(truc: "Trực Định", nenlam: """
 Động đất , ban nền đắp nền , làm hay sửa phòng Bếp , đặt yên chỗ máy dệt ( hay các loại máy ) , nhập học , nạp lễ cầu thân , nạp đơn
            dâng  sớ , sửa hay làm thuyền chèo , đẩy thuyền mới xuống nước , khởi công  làm lò nhuộm lò gốm
""", khongnen: "Mua nuôi thêm súc vật"),
        objectTruc(truc: "Trực Chấp", nenlam: "lập khế ước , giao dịch , động đất ban nền , cầu thầy chữa bệnh , đi săn thú cá , tìm bắt trộm cướp", khongnen: " xây đắp nền-tường"),
        objectTruc(truc: "Trực Phá", nenlam: "lập khế ước , giao dịch , động đất ban nền , cầu thầy chữa bệnh , đi săn thú cá , tìm bắt Hốt thuốc , uống thuốc", khongnen: """
 Lót giường đóng giường , cho vay , động thổ , ban nền đắp
                nền , vẽ họa chụp ảnh , lên quan nhậm chức , thừ kế chức tước hay sự  nghiệp , nhập học , học kỹ nghệ , nạp lễ cầu thân , vào làm hành chánh , nạp đơn dâng sớ , đóng thọ dưỡng sanh
"""),
        objectTruc(truc: "Trực Nguy ", nenlam: "lót giường đóng giường , đi săn thú cá , khởi công làm lò nhuộm lò gốm", khongnen: "xuất hành đường thủy"),
                objectTruc(truc: "Trực Thành", nenlam: """
Lập khế ước , giao dịch , cho vay , thâu nợ , mua hàng , bán hàng , xuất hành , đi thuyền , đem ngũ cốc vào kho , khởi tạo , động Thổ  , ban nền đắp nền , gắn cửa , đặt táng , kê gác , gác đòn đông , dựng  xây kho vựa , làm hay sửa chữa phòng Bếp , thờ phụng Táo Thần , đặt yên  chỗ máy dệt ( hay các loại máy ) , gặt lúa , đào ao giếng , tháo nước ,  cầu thầy chữa bệnh , mua trâu ngựa , các việc trong vụ nuôi tằm , làm  chuồng gà ngỗng vịt , nhập học , nạp lễ cầu thân , cưới gã , kết hôn ,  nạp nô tỳ , nạp đơn dâng sớ , học kỹ nghệ , khởi công làm lò nhuộm lò  gốm , làm hoặc sửa thuyền chèo , đẩy thuyền mới xuống nước ,
                    vẽ tranh ,  bó cây để chiết nhánh
""", khongnen: "Kiện tụng , phân tranh"),
                objectTruc(truc: "Trực Thâu", nenlam: "Đem ngũ cốc vào kho , cấy lúa gặt lúa , mua trâu , nuôi tằm , đi săn thú cá , bó cây để chiết nhánh", khongnen: """
 Lót giường đóng giường , động đất , ban nền đắp nền , nữ
                    nhân khởi ngày uống thuốc , lên quan lãnh chức , thừa kế chức tước hay  sự nghiệp, vào làm hành chánh , nạp đơn dâng sớ , mưu sự khuất lấp
"""),
        objectTruc(truc: "Trực Khai", nenlam: " Xuất hành , đi thuyền , khởi tạo , động thổ , ban nền đắp nền  , dựng xây kho vựa , làm hay sửa phòng Bếp , thờ cúng Táo Thần , đóng  giường lót giường , may áo , đặt yên chỗ máy dệt hay các loại máy , cấy  lúa gặt lúa , đào ao giếng , tháo nước , các việc trong vụ nuôi tằm , mở  thông hào rảnh , cấu thầy chữa bệnh , hốt thuốc , uống thuốc , mua trâu  , làm rượu , nhập học , học kỹ nghệ , vẽ tranh , khởi công  làm lò nhuộm  lò gốm , làm chuồng gà ngỗng vịt , bó cây để chiết nhánh.", khongnen: "Chôn cất"),
                    objectTruc(truc: "Trực Bế ", nenlam: """
                    xây đắp tường , đặt táng , gắn cửa , kê gác , gác đòn đông ,
                    làm cầu tiêu. khởi công lò nhuộm lò gốm , uống thuốc , trị bệnh (
                    nhưng  chớ trị bệnh mắt ) , bó cây để chiết nhánh
                    """, khongnen: "Lên quan lãnh chức , thừa kế chức tước hay sự nghiệp , nhập học , chữa bệnh mắt , các việc trong vụ nuôi tằm"),
    ]
    
    public static let gio = [
        "Tý ( 23h-1h ) ", " Sửu ( 1h-3h ) ", " Dần ( 3h-5h ) ", " Mão ( 5h-7h ) ", " Thìn ( 7h-9h ) ", " Tỵ ( 9h-11h ) ", " Ngọ ( 11h-13h )", "Mùi ( 13h-15h ) ", " Thân ( 15h-17h )", "Dậu ( 17h-19h ) ", "Tuất ( 19h-21h ) ", "Hợi ( 21h-23h ) "
    ]
    
    public static func daysBetween2Dates(time1:Date , time2:Date ) ->Int{
    
        return (time2.millisecondsSince1970 - time1.millisecondsSince1970) / 86400000;
    }
    public static func createDate(day:Int,month:Int,year:Int)->Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        //("\(year)/\(month)/\(day) 00:00")
        let someDateTime = formatter.date(from: "\(year)/\(month)/\(day) 07:00")
        print(someDateTime)
        return someDateTime!
    }
    public static func nhiThapBatTu(time:Date) ->Int{
        return (Int(daysBetween2Dates(time1: Const.createDate(day: 1, month: 1, year: 1975), time2: time))) % 28
    }
    public static func INT(d: Double)-> Int {
        return  Int(d.rounded(.down))
    }
    public static func gioHoangDao(dmy:Date) ->[Int]{
        let chi = Const.chi(dmy: dmy)[0]
        if([0,6].contains(chi)){
            return [0,1,3,6,8,9]
        }
        if([1,7].contains(chi)){
            return [2,3,5,8,10,11]
        }
        
        if([2,8].contains(chi)){
            return [0,1,4,5,7,10]
        }
        if([3,9].contains(chi)){
            return [0,2,3,6,7,9]
        }
        if([4,10].contains(chi)){
            return [2,4,5,8,9,11]
        }
        if([5,11].contains(chi)){
            return [1,4,6,7,10,11]
        }
        return  []
    }
    public static func hoangdao(time:Date)->Int{
        print("hoangdao:",time)
        let chi = (VietCalendar().jdFromDate(dd: Const.calendar.component(.day, from: time), mm: Const.calendar.component(.month, from: time), yy: Const.calendar.component(.year, from: time)) + 1) % 12
        let m = Const.calendar.component(.month, from: time)
        print("chi:",chi)
        print("m:",m)
        if([1,5].contains(m)){
            if([1,3,8,9].contains(chi)){
                return 0
            }
            if([2,5,7,11].contains(chi)){
                return 1
            }
            return 2
        }
        if([2,8].contains(m)){
            if([2,3,7,9].contains(chi)){
                return 0
            }
            if([1,5,8,11].contains(chi)){
                return 1
            }
            return 2
        }
        if([3,9].contains(m)){
            if([4,5,9,11].contains(chi)){
                return 0
            }
            if([1,7,10,8].contains(chi)){
                return 1
            }
            return 2
        }
        if([4,10].contains(m)){
            if([1,6,7,9].contains(chi)){
                return 0
            }
            if([9,5,3,0].contains(chi)){
                return 1
            }
            return 2
        }
        if([6,11].contains(m)){
            if([3,5,10,11].contains(chi)){
                return 0
            }
            if([1,4,7,9].contains(chi)){
                return 1
            }
            return 2
        }
        if([7,12].contains(m)){
            if([0,1,5,7].contains(chi)){
                return 0
            }
            if([3,6,9,11].contains(chi)){
                return 1
            }
            return 2
        }
        return 2
    }
//    public static func tietKhi( dmy:Date) ->Int{
//        let moc:[Date] = tietKhiMoc(Const.calendar.component(.year, from: dmy));
//        if (Const.calendar.component(.day, from: dmy) == 31 && Const.calendar.component(.month, from: dmy) == 12) {
//            return 23;
//        }
//        for i in 0...23 {
//            let a = daysBetween2Dates(time1: moc[i], time2: dmy);
//            let b = daysBetween2Dates(time1: moc[i + 1], time2: dmy);
//            if (a < 0) {
//                return 23;
//            }
//            if (b < 0) {
//                return i;
//            }
//        }
//        return -1;
//    }
//
    public static func localToJD(dmy:Date) -> Double{
        return universalToJD(dmy: dmy) - 0.2916666666666667
    }
    
    public static func universalToJD(dmy:Date) -> Double{
    let D = Const.calendar.component(.day, from: dmy)
    let M = Const.calendar.component(.month, from: dmy)
    let Y = Const.calendar.component(.year, from: dmy)
        
    if (Y > 1582 || ((Y == 1582 && M > 10) || (Y == 1582 && M == 10 && D > 14))) {
        let a = INT(d: Double((((INT(d: Double(((M + 9) / 12)) + Double(Y)) * 7) / 4))))
        let b = INT(d: Double((((INT(d: Double(((((M - 9) / 7) + Y) / 100))) + 1) * 3) / 4)))
        let c = INT(d: Double(((M * 275) / 9)))
        let d = Double((((((Y * 367) - a) - b) + c) + D))
        return (d) + 1721028.5
    }
        let a = INT(d: Double(((((Y + 5001) + INT(d:Double(((M - 9) / 7)))) * 7) / 4)))
        let b = INT(d: Double(((M * 275) / 9)))
        let aa = ((Y * 367) - a)
        let c = Double(((aa + b) + D))
        return (c) + 1729776.5
    }

    public static func chi(dmy:Date) ->[Int]{
        let vnmDate:Date = VietCalendar().minh(d: Const.calendar.component(.day, from: dmy), m: Const.calendar.component(.month, from: dmy), y: Const.calendar.component(.year, from: dmy));
        //DayMonthYear lunar = new DayMonthYear(vnmDate.getDayOfMonth(), vnmDate.getMonth(), vnmDate.getYear());
        return [INT(d: localToJD(dmy: dmy) + 2.5) % 12, (Const.calendar.component(.month, from: dmy) + 1) % 12, (Const.calendar.component(.year, from: dmy) + 8) % 12];
    }

    public static let SUNLONG_MAJOR = [4.974188368183839, 5.235987755982989, 5.497787143782138, 5.759586531581287, 6.021385919380436, 0.0, 0.2617993877991494, 0.5235987755982988, 0.7853981633974483, 1.0471975511965976, 1.3089969389957472        , 1.5707963267948966        , 1.832595714594046        , 2.0943951023931953, 2.356194490192345, 2.6179938779914944, 2.8797932657906435, VietCalendar().pi, 3.4033920413889427, 3.665191429188092
        , 3.9269908169872414, 4.1887902047863905, 4.4505895925855405, 4.71238898038469]
    public static func maxDayOfMonth(m:Int, y:Int) ->Int{
        if (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12) {
            return 31;
        }
        if (m == 4 || m == 6 || m == 9 || m == 11) {
            return 30;
        }
        if (m != 2) {
            return 0;
        }
        if ((y % 4 != 0 || y % 100 == 0) && y % 400 != 0) {
            return 28;
        }
        return 29;
    }
    public static func addDay(dmy:Date, add:Int) ->Date{
        var D = Const.calendar.component(.day, from: dmy)
        var M = Const.calendar.component(.month, from: dmy)
        var Y = Const.calendar.component(.year, from: dmy)
        D =  D + add;
        while (true) {
            if (D > maxDayOfMonth(m: M, y: Y)) {
                D = D - maxDayOfMonth(m: M, y: Y);
                M = M + 1
                if (M > 12) {
                    M = 1;
                    Y = Y + 1;
                }
            }
            if (D <= 0) {
                M = M - 1;
                if (M < 1) {
                    M = 12;
                    Y = Y - 1;
                    D = D + 31;
                } else {
                    D =  D + maxDayOfMonth(m: M, y: Y);
                }
            }
            if (D >= 0 && D <= maxDayOfMonth(m: M, y: Y)) {
                return Const.createDate(day: D, month: M, year: Y)
            }
        }
    }

    public static func tietKhiMoc(Y:Int) ->[Date]{
        var ret:[Date] = [Date](repeating: Date(), count: 25)
        var i = 0;
        var dmy = Const.createDate(day: 5, month: 1, year: Y)
        while (i < 24) {
            if (i == 5) {
                while (VietCalendar().SunLongitude(jdn:localToJD(dmy: dmy)) > SUNLONG_MAJOR[6]) {
                    dmy = addDay(dmy: dmy, add: 1);
                }
            } else {
                while (VietCalendar().SunLongitude(jdn:localToJD(dmy: dmy)) < SUNLONG_MAJOR[i]) {
                    dmy = addDay(dmy: dmy, add: 1);
                }
            }
            ret[i] = addDay(dmy: dmy, add: -1);
            dmy = addDay(dmy: dmy, add: 14);
            i = i + 1;
        }
        ret[i] = Const.createDate(day: 31, month: 12, year: Y)
        return ret;
    }
    public static let TIETKHI = ["Tiểu hàn", "Đại hàn", "Lập xuân ", "Vũ thủy", "Kinh trập", "Xuân phân", "Thanh minh", "Cốc vũ", "Lập hạ", "Tiểu mãn", "Mang chủng", "Hạ chí", "Tiểu thử", "Đại thử", "Lập thu", "Xử thử", "Bạch lộ", "Thu phân", "Hàn lộ", "Sương giáng", "Lập đông", "Tiểu tuyết", "Đại tuyết", "Dong chi"]

//    public static int tietKhi(DayMonthYear dmy) {
//        DayMonthYear[] moc = tietKhiMoc(dmy.getYear());
//        if (dmy.getDay() == 31 && dmy.getMonth() == 12) {
//            return 23;
//        }
//        for i in 0...23 {
//            long a = daysBetween2Dates(moc[i], dmy);
//            long b = daysBetween2Dates(moc[i + 1], dmy);
//            if (a < 0) {
//                return 23;
//            }
//            if (b < 0) {
//                return i;
//            }
//        }
//        return -1;
//    }
        public static func tietKhi( dmy:Date) ->Int{
            let moc:[Date] = tietKhiMoc(Y: Const.calendar.component(.year, from: dmy));
            if (Const.calendar.component(.day, from: dmy) == 31 && Const.calendar.component(.month, from: dmy) == 12) {
                return 23;
            }
            for i in 0...23 {
                let a = daysBetween2Dates(time1: moc[i], time2: dmy);
                let b = daysBetween2Dates(time1: moc[i + 1], time2: dmy);
                if (a < 0) {
                    return 23;
                }
                if (b < 0) {
                    return i;
                }
            }
            return -1;
        }

    public static func truci(dmy:Date) ->Int{
        for i in stride(from: 1, to: 24, by: 2) {
            if (daysBetween2Dates(time1: dmy, time2: tietKhiMoc(Y: Const.calendar.component(.year, from: dmy))[i]) > 0) {
                return ((Const.chi(dmy:dmy)[0] + 12) - (i / 2)) % 12;
            }
        }
        return Const.chi(dmy:dmy)[0];
    }
    public static func jdFromDate( dd:Int, mm:Int, yy:Int) -> Int64{
        let a = (14 - mm) / 12;
        let y = (yy + 4800) - a;
        let m = ((a * 12) + mm) - 3;
        let jd = ((((((((m * 153) + 2) / 5) + dd) + (y * 365)) + (y / 4)) - (y / 100)) + (y / 400)) - 32045;
        if (jd < 2299161) {
            let b = (((m * 153) + 2) / 5)
            let c = ((b + dd) + (y * 365))
            let d = (c + (y / 4))
            return Int64(d - 32083)
        }
        return Int64(jd)
    }
    public static func getCanChiLunarDay(dd:Int, mm:Int, yy:Int) ->[Int]{
        let jd = Const.jdFromDate(dd: dd, mm: mm, yy: yy)
        return [Int((jd + 9) % 10), Int((jd + 1) % 12)]
    }

    
    
    
    // lich ca nhan
    public static var objLich:objectLich?
    public static let appID = "ca-app-pub-3940256099942544~3347511713"
    public static let bannerId = "ca-app-pub-3940256099942544/6300978111"
    public static let interstitialId = "ca-app-pub-3940256099942544/1033173712"
    public static var countAction = 0 // moi 5 lan chon chuc nang se hien quang cao fullscreen
    public static var timeRepeat = 0
    
    
    
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
extension Date {
    var millisecondsSince1970:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
}
