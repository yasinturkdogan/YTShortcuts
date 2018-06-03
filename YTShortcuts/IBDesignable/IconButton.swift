//
//  IconButton.swift
//  YTShortcuts
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class IconButton: UIButton {

    public override func awakeFromNib() {
        super.awakeFromNib()
        render()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        render()
    }
    
    private func render() {
        self.imageView?.contentMode = .scaleAspectFit
        self.contentMode = .center        
    }
    
}
