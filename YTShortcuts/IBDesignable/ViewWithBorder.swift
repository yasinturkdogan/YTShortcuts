//
//  ViewWithBorder.swift
//  YTShortcuts
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class ViewWithBorder: UIView {
    @IBInspectable var cornerRadius:CGFloat = 5
    @IBInspectable var borderColor:UIColor = .lightGray
    @IBInspectable var borderWidth:CGFloat = 1

    open override func awakeFromNib() {
        super.awakeFromNib()
        render()
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        render()
    }
    
    private func render() {
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
    }
    
}
