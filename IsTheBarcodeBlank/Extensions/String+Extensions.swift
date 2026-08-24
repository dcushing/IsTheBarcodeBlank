//
//  String+Extensions.swift
//  IsTheBarcodeBlank
//
//  Created by Danielle Cushing on 8/24/26.
//

import Foundation

extension String {
    var isNumber: Bool {
        guard self.isNotEmpty else { return false }
        return Double(self) != nil
    }
    
    var isUrl: Bool {
        guard self.isNotEmpty else { return false }
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
            if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
                // it is a link, if the match covers the whole string
                return match.range.length == self.utf16.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }

    var isNotEmpty: Bool { return !self.isEmpty }
}
