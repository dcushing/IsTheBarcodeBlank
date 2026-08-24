//
//  String+Extensions.swift
//  IsTheBarcodeBlank
//
//  Created by Danielle Cushing on 8/24/26.
//

import Foundation

extension String {
    var asInt: Int? { return Int(self) }
    var asDouble: Double? { return Double(self) }
    
    var isNumber: Bool {
        guard self.isNotEmpty else { return false }
        return asDouble != nil || asInt != nil
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

    var isEven: Bool {
        guard let asDouble else { return false }
        return asDouble.isEven
    }

    var isNegative: Bool {
        guard let asDouble else { return false }
        return asDouble.isNegative
    }
}
