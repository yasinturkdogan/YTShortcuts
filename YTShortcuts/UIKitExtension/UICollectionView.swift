//
//  UICollectionView.swift
//  TarifKupu
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation
import UIKit

public extension UICollectionView {
    /// Dequeues a cell with the same reuse identifier of the class name
    func dequeue<T>(for indexPath:IndexPath)->T where T:UICollectionViewCell {
        return self.dequeueReusableCell(withReuseIdentifier: T.cellIdentifier, for: indexPath) as! T
    }
    
    func dequeue<T>(ofKind kind:String, for indexPath:IndexPath)->T where T:UICollectionReusableView {
        return self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}
