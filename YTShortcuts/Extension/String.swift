//
//  String.swift
//  YTShortcuts
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation
import UIKit

public extension String {
    ///Check if the string is a valid email
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self.lowercased())
    }
    
    ///Calculates height for given UILabel
    func calculateHeight(for label:UILabel) -> CGFloat {
        let constraintRect = CGSize(width: label.frame.width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: label.font!], context: nil)
        return boundingBox.height
    }
    
    //Calculates width for given height
    func calculateWidth(for height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.width)
    }
    
    ///Returns the localized string using the main bundle
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    ///Returns the localized string using the main bundle and replaces the %index parameters with given values
    func localize(with: String...) -> String {
        var localizedText = self.localize()
        var index: Int = 1
        for param in with {
            localizedText = localizedText.replacingOccurrences(of: "%" + String(index), with: param);
            index += 1;
        }
        return localizedText
    }
    
    ///Cast to int with force-wrapping
    func toInt() -> Int {
        return Int(self) ?? 0
    }

    ///Percent encode string with urlHostAllowed values
    func escape() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    ///Return matching strings with the given regex
    func matches(regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    
    func capitalize() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    ///Capitalize the first letter
    func capitalizeFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    ///Capitalize the first letter of each word
    func capitalizeFirstLetterOfEachWord() -> String {
        return self.components(separatedBy: " ")
            .map { return $0.lowercased().capitalizeFirstLetter() }
            .joined(separator: " ")
    }
    
    func capitalizeEachWord() -> String {
        return self.components(separatedBy: " ")
            .map { return $0.lowercased().capitalize() }
            .joined(separator: " ")
    }
    
    ///Clears all html tags
    func clearHtml()->String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil);
    }
    
    ///Removes the given html tag.
    func remove(htmlTag:String)->String {
        return self.replacingOccurrences(of: "<" + htmlTag + "[^>]+>.*?</" + htmlTag + ">", with: "", options: .regularExpression, range: nil);
    }
}

public extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ..< end]
    }
    
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ... end]
    }
    
    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        return self[start ... end]
    }
    
    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ... end]
    }
    
    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ..< end]
    }
}

public extension Substring {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ..< end]
    }
    
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ... end]
    }
    
    
    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        return self[start ... end]
    }
    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ... end]
    }
    
    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ..< end]
    }
}

public extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
}


public extension String {
    static func random(length: Int = 6, letters:String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789") -> String {
        var randomString:String = ""
        
        for _ in 1...length{
            let length = UInt32 (letters.count)
            let rand = arc4random_uniform(length)
            randomString.append(letters[Int(rand)])
        }
        
        return randomString
    }
}
