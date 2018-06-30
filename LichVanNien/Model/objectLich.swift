//
//  objectLich.swift
//  LichVanNien
//
//  Created by TBM on 6/29/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import Foundation
import UIKit
class objectLich{
    var id:Int 
    var tieude:String
    var giothu:String
    var al:String
    var dl:String
    var lap:String
    var luc:String
    var diadiem:String
    var ghichu:String
    var time:Date
    init(a:String,b:String,c:String,d:String,e:String,f:String,g:String,h:String,i:Int,j:Date) {
        tieude = a
        giothu = b
        al = c
        dl = d
        lap = e
        luc = f
        diadiem = g
        ghichu = h
        id = i
        time = j
    }
}
