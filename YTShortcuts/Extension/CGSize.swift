//
//  CGSize.swift
//  YTShortcuts
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation
import UIKit

extension CGSize {
    
    /// Calculates size for a cell based on device width
    static func sizeForCell(numberOfItems:CGFloat, collectionMargin:CGFloat, cellSpacing:CGFloat, ratio:CGFloat, extraHeight:CGFloat) -> CGSize {
        let availableWidth = CGFloat(UIDevice.width - collectionMargin * 2) - CGFloat((numberOfItems - 1) * cellSpacing)
        let eachWidth = availableWidth / numberOfItems
        return CGSize(width: eachWidth, height: eachWidth * ratio + extraHeight)
    }
    
    /// Calculates size for a cell based on device width
    static func sizeForCell(numberOfItems:CGFloat, collectionMargin:CGFloat, cellSpacing:CGFloat, height:CGFloat) -> CGSize {
        let availableWidth = CGFloat(UIDevice.width - collectionMargin * 2) - CGFloat((numberOfItems - 1) * cellSpacing)
        let eachWidth = availableWidth / numberOfItems
        return CGSize(width: eachWidth, height: height)
    }
    
    /// Multiply width and height
    func multiply(w:CGFloat, h:CGFloat)->CGSize {
        return CGSize(width: self.width * w, height: self.height * h)
    }
    
    /// Divide width and height
    func divide(w:CGFloat, h:CGFloat)->CGSize {
        return CGSize(width: self.width / w, height: self.height / h)
    }
}
