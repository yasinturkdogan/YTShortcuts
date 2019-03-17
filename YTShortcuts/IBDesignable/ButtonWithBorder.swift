//
//  ButtonWithBorder.swift
//  YTShortcuts
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class ButtonWithBorder: UIButton {
    @IBInspectable var cornerRadius:CGFloat = 5
    @IBInspectable var borderColor:UIColor = .lightGray
    @IBInspectable var borderWidth:CGFloat = 1
    
    private var activityIndicator:UIActivityIndicatorView?
    
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
        
        let bold = self.titleLabel!.font.fontDescriptor.symbolicTraits.contains(UIFontDescriptor.SymbolicTraits.traitBold)
        self.titleLabel!.font = UIFont(name: bold ? "SFProText-Heavy" : "SFProText-Medium", size: self.titleLabel!.font.pointSize)
    }
    
    public func startLoading() {
        self.isEnabled = false
        
        self.titleLabel?.removeFromSuperview()
        
        activityIndicator = UIActivityIndicatorView(style: .white)
        activityIndicator!.center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        activityIndicator!.startAnimating()
        self.addSubview(activityIndicator!)
    }
    
    public func stopLoading() {
        self.isEnabled = true
        
        if let titleLabel = self.titleLabel {
            self.addSubview(titleLabel)
        }
        
        activityIndicator?.removeFromSuperview()
        activityIndicator = nil
    }
    
}
