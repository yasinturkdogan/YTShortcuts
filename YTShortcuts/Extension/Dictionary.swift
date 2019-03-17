//
//  Dictionary.swift
//  YTShortcuts
//
//  Created by Yasin Türkdoğan on 17/03/2019.
//  Copyright © 2019 Yasin Türkdoğan. All rights reserved.
//

import Foundation

public protocol DictionaryKey {
    var rawValue:String { get }
}

public extension Dictionary where Key == String, Value == Any {    
    func get<T:Any>(_ key:DictionaryKey, defaultValue:T)->T {
        return (self[key.rawValue] as? T) ?? defaultValue
    }
}

