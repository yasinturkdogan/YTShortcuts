//
//  Notification.swift
//  YTShortcuts
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation

public struct Event {
    enum Application:String, EventProtocol {
        case WillEnterBackground
        case DidEnterBackground
        case DidBecomeActive
        case DidRegisterForRemoteNotificationsWithDeviceToken
        case DidFinishLaunchingWithOptions
    }
        
    public static func remove(_ listener: AnyObject) {
        NotificationCenter.default.removeObserver(listener)
    }
}

public protocol EventProtocol {
    var rawValue:String { get }
}

extension NSNotification.Name : EventProtocol {
}

public extension EventProtocol {
    func post(with: Any? = nil) {
        NotificationCenter.default.post(name:  Notification.Name(rawValue: self.rawValue), object: with)
    }
    
    func add(_ observer: Any, selector aSelector: Selector, object: Any? = nil) {
        NotificationCenter.default.removeObserver(observer, name: Notification.Name(rawValue: self.rawValue), object: nil)
        NotificationCenter.default.addObserver(observer, selector: aSelector, name: Notification.Name(rawValue: self.rawValue), object: object)
    }
    
    func remove(_ observer: Any) {
        NotificationCenter.default.removeObserver(observer, name: Notification.Name(rawValue: self.rawValue), object: nil)
    }
}
