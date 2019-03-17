//
//  UserDefaults.swift
//  YTShortcuts
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation

public extension UserDefaults {
    static func remove(keys: [UserDefaultsKey]) {
        for key in keys {
            UserDefaults.standard.removeObject(forKey: key.rawValue)
        }
        
        UserDefaults.standard.synchronize()
    }
}

public protocol UserDefaultsKey {
    var rawValue: String { get }
}

public extension UserDefaultsKey {
    func save(_ value: String) {
        UserDefaults.standard.set(value, forKey: self.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func save(_ value: [String]) {
        UserDefaults.standard.set(value, forKey: self.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func save(_ value: Int) {
        UserDefaults.standard.set(value, forKey: self.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func save(_ value: URL) {
        UserDefaults.standard.set(value, forKey: self.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func get(defaultValue: String? = nil) -> String? {
        return UserDefaults.standard.string(forKey: self.rawValue) ?? defaultValue
    }
    
    func get() -> Int {
        return UserDefaults.standard.integer(forKey: self.rawValue)
    }
    
    func get() -> URL? {
        return UserDefaults.standard.url(forKey: self.rawValue)
    }
    
    func delete() {
        UserDefaults.standard.removeObject(forKey: self.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func makeTrue() {
        save("true")
    }
    
    func makeFalse() {
        save("false")
    }
    
    func isTrue(defaultValue: Bool = false) -> Bool {
        return self.get(defaultValue: defaultValue ? "true" : nil) == "true"
    }
    
    func isFalse(defaultValue: Bool = false) -> Bool {
        return self.get(defaultValue: defaultValue ? "false" : nil) == "false"
    }
    
    func isSet() -> Bool {
        return self.get() != nil
    }
    
    func array() -> [String] {
        return (UserDefaults.standard.array(forKey: self.rawValue) as? [String]) ?? [String]()
    }
    
    func append(_ value: String) {
        if self.isInArray(value) {
            return
        }
        
        var array = self.array()
        array.append(value)
        self.save(array)
    }
    
    func remove(_ value: String) {
        var array = self.array()
        array.remove(value)
        self.save(array)
    }
    
    func isInArray(_ value: String) -> Bool {
        return self.array().contains(value)
    }
}
