//
//  UICollectionView.swift
//  TarifKupu
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    /// Dequeues a cell with the same reuse identifier of the class name
    public func dequeue<T>(for indexPath:IndexPath)->T where T:UICollectionViewCell {
        return self.dequeueReusableCell(withReuseIdentifier: T.cellIdentifier, for: indexPath) as! T
    }
}
