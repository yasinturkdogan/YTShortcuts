//
//  EventDispatcher.swift
//  YTShortcuts
//  Created by Yasin Turkdogan on 27/10/2019.
//  Copyright © 2019 Yasin Türkdoğan. All rights reserved.
//  

import Foundation

public class EventDispatcher: NSObject {

    private let dispatcher = NotificationCenter()
        
    public func dispatch(_ event:EventProtocol, with: Any? = nil) {
        dispatcher.post(name: Notification.Name(rawValue: event.rawValue), object: with)
    }
    
    public func register(_ event:EventProtocol, observer:Any, selector aSelector: Selector) {
        dispatcher.addObserver(observer, selector: aSelector, name: Notification.Name(rawValue: event.rawValue), object: nil)
    }
    
    public func unregister(_ event:EventProtocol, observer:Any, selector aSelector: Selector) {
        dispatcher.removeObserver(observer, name: Notification.Name(rawValue: event.rawValue), object: nil)
    }
    
    public func unregisterObserver(_ observer:Any) {
        dispatcher.removeObserver(observer)
    }
}
