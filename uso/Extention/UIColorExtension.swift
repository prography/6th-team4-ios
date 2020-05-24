//
//  UIColor+Hex.swift
//  uso_ios
//
//  Created by Apple on 2020/04/15.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit

// Make UIColor possiple to register as hex
extension UIColor {
    convenience init(hex: Int) {
        self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0, green: CGFloat((hex & 0x00FF00) >> 8) / 255.0, blue: CGFloat(hex & 0x0000FF) / 255.0, alpha: 1)
    }
}
