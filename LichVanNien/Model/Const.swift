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
