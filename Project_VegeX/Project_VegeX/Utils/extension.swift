//
//  extension.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/14.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    // 텍스트에 사용되는 검정색
    static let vegeTextBlack = UIColor(rgb: 0x303033)
    // 컨셉컬러 그린
    static let vegeGreen = UIColor(rgb: 0x156941)
    // 옅은 회색 배경
    static let vegeGrayBackground = UIColor(rgb: 0xf1f2f4)
}
