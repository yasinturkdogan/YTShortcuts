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
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: label.font], context: nil)
        return boundingBox.height
    }
    
    //Calculates width for given height
    func calculateWidth(for height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        return ceil(boundingBox.width)
    }
    
    ///Returns the localized string using the main bundle
    public func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    ///Returns the localized string using the main bundle and replaces the %index parameters with given values
    public func localizeWith(_ params: String...) -> String {
        var localizedText = self.localize()
        var index: Int = 1
        for param in params {
            localizedText = localizedText.replacingOccurrences(of: "%" + String(index), with: param);
            index += 1;
        }
        return localizedText
    }
    
    ///Cast to int with force-wrapping
    func toInt() -> Int {
        return Int(self)!
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
    
    ///Clears all html tags
    func clearHtml()->String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil);
    }
    
    ///Removes the given html tag.
    func remove(htmlTag:String)->String {
        return self.replacingOccurrences(of: "<" + htmlTag + "[^>]+>.*?</" + htmlTag + ">", with: "", options: .regularExpression, range: nil);
    }
    
}

