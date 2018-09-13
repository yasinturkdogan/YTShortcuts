//
//  UIDevice.swift
//  YTShortcuts
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation
import UIKit

@available(iOSApplicationExtension, unavailable)
public extension UIDevice {
    
    static var width:CGFloat {
        get {
            return UIApplication.shared.keyWindow!.frame.size.width
        }
    }
    
    static var height:CGFloat {
        get {
            return UIApplication.shared.keyWindow!.frame.size.height
        }
    }
    
    static var isIPad:Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad;
    }
    
    static var isIPhone:Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone;
    }
    
    static var isLandscape:Bool {
        return UIDevice.width > UIDevice.height
    }
    
    /// Force rotates the device to fiven orientation
    class func rotate(to:UIInterfaceOrientation) {
        UIDevice.current.setValue(to.rawValue, forKey: "orientation");
    }
}
