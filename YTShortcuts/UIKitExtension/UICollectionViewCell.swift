//
//  UICollectionViewCell.swift
//  YTShortcuts
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    class var cellIdentifier : String {
        return "\(self)"
    }
    
    /// registers cell to given collection view
    class func register(to:UICollectionView) {        
        to.register(UINib(nibName: "\(self)", bundle: nil), forCellWithReuseIdentifier: "\(self)");
    }
}
