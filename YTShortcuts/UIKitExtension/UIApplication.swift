//
//  UIApplication.swift
//  YTShortcuts
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation
import UIKit

public extension UIApplication {
    
    /// Returns application version string
    static var version:String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String;
    }
    
    /// Returns application build number
    static var build:String {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as NSString as String) as! String;
    }
    
    /// Returns application version and build number
    static var fullVersion:String {
        let version = UIApplication.version, build = UIApplication.build
        return "\(version) (\(build))"
    }
    
    /// Opens given url in safari
    @available(iOSApplicationExtension, unavailable)
    func open(url:URL) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
        } else {
            _ = UIApplication.shared.openURL(url)
        }
    }
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
