//
//  UITableView.swift
//  YTShortcuts
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView {
    /// Dequeues a cell with the same reuse identifier of the class name
    public func dequeue<T>()->T where T:UITableViewCell{
        return self.dequeueReusableCell(withIdentifier: T.cellIdentifier) as! T
    }
    
    /// Dequeues a cell with the same reuse identifier of the class name
    public func dequeue<T>(for indexPath:IndexPath)->T where T:UITableViewCell{
        return self.dequeueReusableCell(withIdentifier: T.cellIdentifier, for: indexPath) as! T
    }
}
