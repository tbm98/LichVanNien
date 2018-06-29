//
//  VietCalendar.swift
//  Lich
//
//  Created by TBM on 6/27/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import Foundation
class VietCalendar{
    let pi = Double.pi
    
    func jdFromDate(dd: Int, mm: Int, yy: Int) ->Int {
        let a = (14 - mm) / 12
        let y = yy + 4800 - a
        let m = mm + 12 * a - 3
        var jd = dd + (153 * m + 2) / 5 + 365 * y + y / 4 - y / 100 + y / 400 - 32045
        if (jd < 2299161) {
            jd = dd + (153 * m + 2) / 5 + 365 * y + y / 4 - 32083
        }
        //jd = jd - 1721425;
        return jd
    }
    
    func jdToDate(jd: Int) -> [Int]{
        let a: Int
        let b: Int
        let c: Int
        if (jd > 2299160) { // After 5/10/1582, Gregorian calendar
            a = jd + 32044
            b = (4 * a + 3) / 146097
            c = a - b * 146097 / 4
        } else {
            b = 0
            c = jd + 32082
        }
        let d = (4 * c + 3) / 1461
        let e = c - 1461 * d / 4
        let m = (5 * e + 2) / 153
        let day = e - (153 * m + 2) / 5 + 1
        let month = m + 3 - 12 * (m / 10)
        let year = b * 100 + d - 4800 + m / 10
        return [day, month, year]
    }
    func SunLongitude(jdn: Double) -> Double {
        //return CC2K.sunLongitude(jdn);
        return SunLongitudeAA98(jdn: jdn)
    }
    func SunLongitudeAA98(jdn: Double) -> Double {
        let T = (jdn - 2451545.0) / 36525 // Time in Julian centuries from 2000-01-01 12:00:00 GMT
        let T2 = T * T
        let dr = pi / 180 // degree to radian
        let M = 357.52910 + 35999.05030 * T - 0.0001559 * T2 - 0.00000048 * T * T2 // mean anomaly, degree
        let L0 = 280.46645 + 36000.76983 * T + 0.0003032 * T2 // mean longitude, degree
        var DL = (1.914600 - 0.004817 * T - 0.000014 * T2) * sin(dr * M)
        DL = DL + (0.019993 - 0.000101 * T) * sin(dr * 2.0 * M) + 0.000290 * sin(dr * 3.0 * M)
        var L = L0 + DL // true longitude, degree
        L = L - 360.0 * Double(Int(L / 360)) // Normalize to (0, 360)
        return L
    }
    func NewMoon(k: Int) -> Double {
        //return CC2K.newMoonTime(k);
        return NewMoonAA98(k: k)
    }
    func NewMoonAA98(k: Int) -> Double {
        let T = Double(k) / 1236.85 // Time in Julian centuries from 1900 January 0.5
        let T2 = T * T
        let T3 = T2 * T
        let dr = pi / 180
        let p1 = 2415020.75933 + (29.53058868 * Double(k))
        let p2 = (0.0001178 * T2) - (0.000000155 * T3)
        var Jd1 = p1 + p2
        //var Jd1 = 2415020.75933 + (29.53058868 * k) + (0.0001178 * T2) - (0.000000155 * T3)
        
        Jd1 = Jd1 + 0.00033 * sin((166.56 + 132.87 * T - 0.009173 * T2) * dr) // Mean new moon
        let p3 = 29.10535608 * Double(k)
        let p4 = 0.0000333 * T2
        let p5 = 0.00000347 * T3
        
        var M = 359.2242 + p3
        M = M - p4
        M = M - p5 // Sun's mean anomaly
        let p6 = 385.81691806 * Double(k)
        let p7 = 0.0107306 * T2
        let p8 = 0.00001236 * T3
        var Mpr = 306.0253 + p6
        Mpr = Mpr + p7
        Mpr = Mpr + p8 // Moon's mean anomaly
        let p9 = 390.67050646 * Double(k)
        let p10 = 0.0016528 * T2
        let p11 = 0.00000239 * T3
        var F = 21.2964 + p9
        F = F - p10
        F = F - p11 // Moon's argument of latitude
        var C1 = (0.1734 - 0.000393 * T) * sin(M * dr) + 0.0021 * sin(2.0 * dr * M)
        C1 = C1 - 0.4068 * sin(Mpr * dr) + 0.0161 * sin(dr * 2.0 * Mpr)
        C1 = C1 - 0.0004 * sin(dr * 3.0 * Mpr)
        C1 = C1 + 0.0104 * sin(dr * 2.0 * F) - 0.0051 * sin(dr * (M + Mpr))
        C1 = C1 - 0.0074 * sin(dr * (M - Mpr)) + 0.0004 * sin(dr * (2 * F + M))
        C1 = C1 - 0.0004 * sin(dr * (2 * F - M)) - 0.0006 * sin(dr * (2 * F + Mpr))
        C1 = C1 + 0.0010 * sin(dr * (2 * F - Mpr)) + 0.0005 * sin(dr * (2 * Mpr + M))
        let deltat: Double
        if (T < -11) {
            deltat = 0.001 + 0.000839 * T + 0.0002261 * T2 - 0.00000845 * T3 - 0.000000081 * T * T3
        } else {
            deltat = -0.000278 + 0.000265 * T + 0.000262 * T2
        }
        let JdNew = Jd1 + C1 - deltat
        return JdNew
    }
    func INT(d: Double)-> Int {
        return  Int(d.rounded(.down))
    }
    func getSunLongitude(dayNumber: Int, timeZone: Double)-> Double {
        return SunLongitude(jdn: Double(dayNumber) - 0.5 - timeZone / 24)
    }
    func getNewMoonDay(k: Int, timeZone: Double)-> Int {
        let jd = NewMoon(k: k)
        return INT(d: jd + 0.5 + timeZone / 24)
    }
    func getLunarMonth11(yy: Int, timeZone: Double)-> Int {
        let off = Double(jdFromDate(dd: 31, mm: 12, yy: yy)) - 2415021.076998695
        let k = INT(d: off / 29.530588853)
        var nm = getNewMoonDay(k: k, timeZone: timeZone)
        let sunLong = INT(d: getSunLongitude(dayNumber: nm, timeZone: timeZone) / 30)
        if (sunLong >= 9) {
            nm = getNewMoonDay(k: k - 1, timeZone: timeZone)
        }
        return nm
    }
    func getLeapMonthOffset(a11: Int, timeZone: Double)-> Int {
        let k = INT(d: 0.5 + (Double(a11) - 2415021.076998695) / 29.530588853)
        var last: Int // Month 11 contains point of sun longutide 3*PI/2 (December solstice)
        var i = 1 // We start with the month following lunar month 11
        var arc = INT(d: getSunLongitude(dayNumber: getNewMoonDay(k: k + i, timeZone: timeZone), timeZone: timeZone) / 30)
        repeat {
            last = arc
            i = i + 1
            arc = INT(d: getSunLongitude(dayNumber: getNewMoonDay(k: k + i, timeZone: timeZone), timeZone: timeZone) / 30)
        } while (arc != last && i < 14)
        return i - 1
    }
    func convertSolar2Lunar(dd: Int, mm: Int, yy: Int, timeZone: Double)-> [Int] {
        let lunarDay: Int
        var lunarMonth: Int
        var lunarYear: Int
        var lunarLeap: Int
        let dayNumber = jdFromDate(dd: dd, mm: mm, yy: yy)
        let k = INT(d: (Double(dayNumber) - 2415021.076998695) / 29.530588853)
        var monthStart = getNewMoonDay(k: k + 1, timeZone: timeZone)
        if (monthStart > dayNumber) {
            monthStart = getNewMoonDay(k: k, timeZone: timeZone)
        }
        var a11 = getLunarMonth11(yy: yy, timeZone: timeZone)
        var b11 = a11
        if (a11 >= monthStart) {
            lunarYear = yy
            a11 = getLunarMonth11(yy: yy - 1, timeZone: timeZone)
        } else {
            lunarYear = yy + 1
            b11 = getLunarMonth11(yy: yy + 1, timeZone: timeZone)
        }
        lunarDay = dayNumber - monthStart + 1
        let diff = INT(d: Double(((monthStart - a11) / 29)))
        lunarLeap = 0
        lunarMonth = diff + 11
        if (b11 - a11 > 365) {
            let leapMonthDiff = getLeapMonthOffset(a11: a11, timeZone: timeZone)
            if (diff >= leapMonthDiff) {
                lunarMonth = diff + 10
                if (diff == leapMonthDiff) {
                    lunarLeap = 1
                }
            }
        }
        if (lunarMonth > 12) {
            lunarMonth = lunarMonth - 12
        }
        if (lunarMonth >= 11 && diff < 4) {
            lunarYear -= 1
        }
        return [lunarDay, lunarMonth, lunarYear, lunarLeap]
    }
    func convertLunar2Solar(lunarDay: Int, lunarMonth: Int, lunarYear: Int, lunarLeap: Int, timeZone: Double)-> [Int] {
        let a11: Int
        let b11: Int
        if (lunarMonth < 11) {
            a11 = getLunarMonth11(yy: lunarYear - 1, timeZone: timeZone)
            b11 = getLunarMonth11(yy: lunarYear, timeZone: timeZone)
        } else {
            a11 = getLunarMonth11(yy: lunarYear, timeZone: timeZone)
            b11 = getLunarMonth11(yy: lunarYear + 1, timeZone: timeZone)
        }
        let k = INT(d: 0.5 + (Double(a11) - 2415021.076998695) / 29.530588853)
        var off = lunarMonth - 11
        if (off < 0) {
            off += 12
        }
        if (b11 - a11 > 365) {
            let leapOff = getLeapMonthOffset(a11: a11, timeZone: timeZone)
            var leapMonth = leapOff - 2
            if (leapMonth < 0) {
                leapMonth += 12
            }
            if (lunarLeap != 0 && lunarMonth != leapMonth) {
                print("i:invalid input")
                return [0, 0, 0]
            } else if (lunarLeap != 0 || off >= leapOff) {
                off += 1
            }
        }
        let monthStart = getNewMoonDay(k: k + off, timeZone: timeZone)
        return jdToDate(jd: monthStart + lunarDay - 1)
    }
    func minh(d: Int, m: Int, y: Int)-> Date {
        let TZ = 7.0
        let start = jdFromDate(dd: d, mm: m, yy: y)
        
        
        let jd = start
        let s = jdToDate(jd: jd)
        let l = convertSolar2Lunar(dd: s[0], mm: s[1], yy: s[2], timeZone: TZ)
        let s2 = convertLunar2Solar(lunarDay: l[0], lunarMonth: l[1], lunarYear: l[2], lunarLeap: l[3], timeZone: TZ)
        let s3 = convertLunar2Solar(lunarDay: 14, lunarMonth: 5, lunarYear: 2018, lunarLeap: l[3], timeZone: TZ)
        
        if (s[0] == s2[0] && s[1] == s2[1] && s[2] == s2[2]) {
            print("OK! \(s[0])/\(s[1])/\(s[2])->\(l[0])/\(l[1])/\(l[2])")
            if(l[3] != 0){
                print("leap")
            }
            
        } else {
            print("error! \(s[0])/\(s[1])/\(s[2])->\(l[0])/\(l[1])/\(l[2])")
            if(l[3] != 0){
                print("leap")
            }
            //        Log.e("ERROR! ", "" + s[0] + "/" + s[1] + "/" + s[2] + " -> " + l[0] + "/" + l[1] + "/" + l[2] + if (l[3] == 0) "" else " leap")
        }
        
        
        
        
        return createDate(day:l[0],month:l[1],year:l[2])
    }
    func minh2(d: Int, m: Int, y: Int)-> Date {
        let TZ = 7.0
        let start = jdFromDate(dd: d, mm: m, yy: y)
        
        
        let jd = start
        let s = jdToDate(jd: jd)
        let l = convertSolar2Lunar(dd: s[0], mm: s[1], yy: s[2], timeZone: TZ)
        let s2 = convertLunar2Solar(lunarDay: l[0], lunarMonth: l[1], lunarYear: l[2], lunarLeap: l[3], timeZone: TZ)
        let s3 = convertLunar2Solar(lunarDay: d, lunarMonth: m, lunarYear: y, lunarLeap: l[3], timeZone: TZ)
        
        if (s[0] == s2[0] && s[1] == s2[1] && s[2] == s2[2]) {
            print("OK! \(s[0])/\(s[1])/\(s[2])->\(s3[0])/\(s3[1])/\(s3[2])")
            if(l[3] != 0){
                print("leap")
            }
            
        } else {
            print("error! \(s[0])/\(s[1])/\(s[2])->\(l[0])/\(l[1])/\(l[2])")
            if(l[3] != 0){
                print("leap")
            }
            //        Log.e("ERROR! ", "" + s[0] + "/" + s[1] + "/" + s[2] + " -> " + l[0] + "/" + l[1] + "/" + l[2] + if (l[3] == 0) "" else " leap")
        }
        
        
        
        
        return createDate(day:s3[0],month:s3[1],year:s3[2])
    }
    
    func createDate(day:Int,month:Int,year:Int)->Date{
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.timeZone = TimeZone.current
        //        dateComponents.hour = 8
        //        dateComponents.minute = 34
        
        // Create date from components
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        return someDateTime!
    }
}

