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
    static func fromHex(value: NSInteger, alpha:CGFloat = 1) -> UIColor {
        let red: CGFloat = CGFloat((value & 0xFF0000) >> 16) / 255.0
        let green: CGFloat = CGFloat((value & 0x00FF00) >> 8) / 255.0
        let blue: CGFloat = CGFloat((value & 0x0000FF) >> 0) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: alpha);
    }    
}
