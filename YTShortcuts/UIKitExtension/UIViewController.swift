//
//  UIViewController.swift
//  YTShortcuts
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    class var storyboardID : String {
        return "\(self)"
    }
    
    var safeAreaInsets:UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets ?? UIEdgeInsets.zero
        } else {
            return UIEdgeInsets.zero
        }
    }
}
