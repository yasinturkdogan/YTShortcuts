//
//  Date.swift
//  YTShortcuts
//
//  Created by Yasin Türkdoğan on 17/03/2019.
//  Copyright © 2019 Yasin Türkdoğan. All rights reserved.
//

import Foundation

public extension Date {
    static func daysInSeconds(value:Int) -> Int {
        return 24 * 60 * 60 * value
    }
    
    func toNSDate() -> NSDate {
        return NSDate(timeIntervalSince1970: self.timeIntervalSince1970)
    }
}
