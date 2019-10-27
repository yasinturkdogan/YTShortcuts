//
//  UIColor.swift
//  YTShortcuts
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    
    /// Converts hex value to UICOlor
    convenience init(hex: NSInteger, alpha:CGFloat = 1) {
        let red: CGFloat = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green: CGFloat = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue: CGFloat = CGFloat((hex & 0x0000FF) >> 0) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha);
    }    
}
