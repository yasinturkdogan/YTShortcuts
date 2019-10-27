//
//  Observer.swift
//  YTShortcuts
//  Created by Yasin Turkdogan on 27/10/2019.
//  Copyright © 2019 Yasin Türkdoğan. All rights reserved.
//  

import Foundation

public protocol Observable {
    func addObserver(_ observer: NSObject, forKeyPath keyPath: String, options: NSKeyValueObservingOptions, context: UnsafeMutableRawPointer?)
    
    func removeObserver(_ observer: NSObject, forKeyPath keyPath: String)
    
    func removeAllObservers()
}

extension NSObject : Observable {
    @objc public func removeAllObservers() {
    }
}

public class Observer<T>: NSObject where T: Observable {
    private var objectToObserve:T?
    private var observers = [String: ((T)->Void)]()

    deinit {
        #if DEBUG
        print("✅ DEALLOCATE: \(self)")
        #endif
    }
    
    init(_ objectToObserve:T) {
        self.objectToObserve = objectToObserve
    }
    
    public func observe(keyPath:String, options: NSKeyValueObservingOptions, callback:@escaping (T)->Void, context: UnsafeMutableRawPointer? = nil) {
        guard observers[keyPath] == nil else { return }
        
        observers[keyPath] = callback
        objectToObserve?.addObserver(self, forKeyPath: keyPath, options: options, context: context)
    }
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let keyPath = keyPath else { return }
        guard let objectToObserve = objectToObserve else { return }
        observers[keyPath]?(objectToObserve)
    }

    @objc override public func removeAllObservers() {
        for keyPath in observers.keys {
            objectToObserve?.removeObserver(self, forKeyPath: keyPath)
        }
        
        observers.removeAll()
        objectToObserve = nil
    }
}
