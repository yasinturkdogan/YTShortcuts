//
//  UITableViewCell.swift
//  YTShortcuts
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation
import UIKit

public extension UITableViewCell {
    class var cellIdentifier : String {
        return "\(self)"
    }

    /// Registers cell to given table view
    class func register(to:UITableView) {
        to.register(UINib(nibName: "\(self)", bundle: nil), forCellReuseIdentifier: "\(self)")
    }
    
    /// Registers a UINib from main bundle to given table view
    class func register(to:UITableView, nibName:String) {
        to.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
}
