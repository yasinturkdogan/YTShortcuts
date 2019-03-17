//
//  UIView.swift
//  YTShortcuts
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation
import UIKit

public extension UIView  {
    ///Drops shadow with given parameters
    func dropShadow(color:UIColor = UIColor.fromHex(value:0x000000, alpha: 0.5),
                    radius:CGFloat = 2.0,
                    opacity:Float = 1,
                    size:CGSize = CGSize(width:1.0, height:1.0)) {
        self.layer.shadowOpacity = opacity
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = size
        self.layer.shadowRadius = radius
        self.layer.masksToBounds =  false
    }
    
    /// Instantiate a UINib with the same name of the class name
    class func fromNib<T>()->T {
        return UINib(nibName: "\(self)", bundle: nil).instantiate(withOwner: nil, options: nil).first as! T        
    }
    
    @available (iOS 9, *)
    public func addSubviewToFit(childView:UIView) {
        self.addSubview(childView)
        childView.translatesAutoresizingMaskIntoConstraints = false
        childView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        childView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        childView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        childView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
