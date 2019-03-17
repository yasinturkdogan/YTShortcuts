//
//  UIStoryBoard.swift
//  YTShortcuts
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation
import UIKit

public extension UIStoryboard {
    /// Instantiates a storyboard with the same identifier of the class name
    public func instantiateView<T>()->T where T:UIViewController {
        return self.instantiateViewController(withIdentifier: T.storyboardID) as! T
    }
}
