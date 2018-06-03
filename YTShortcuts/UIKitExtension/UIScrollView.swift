//
//  UIScrollView.swift
//  YTShortcuts
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation
import UIKit

public extension UIScrollView {    
    var isGoingUp:Bool {
        get {
            return self.panGestureRecognizer.velocity(in: self).y < 0
        }
    }
    
    ///Adds a pull up control
    public func addPullUpControl(_ target:Any, onPullComplete:Selector) {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(target, action: onPullComplete, for: .valueChanged)
        self.addSubview(refreshControl)
    }
}
