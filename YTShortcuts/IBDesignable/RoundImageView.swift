//
//  RoundImageView.swift
//  YTShortcuts
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class RoundImageView: UIImageView {
    @IBInspectable var cornerRadius:CGFloat = 8
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        render()
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        render()
    }
    
    private func render() {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
}
