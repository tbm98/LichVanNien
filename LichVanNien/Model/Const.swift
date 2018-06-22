//
//  Const.swift
//  LichVanNien
//
//  Created by TBM on 6/22/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import Foundation
class Const{
    public static let imageBackgrounds = ["nen","nen1","nen2","nen3","nen4","nen5","nen6","nen7","nen8","nen9","nen10","nen11","nen12","valentine1","valentine2"]
    public static func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
}
