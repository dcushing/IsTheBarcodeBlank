//
//  ResultCheck.swift
//  IsTheBarcodeBlank
//
//  Created by Danielle Cushing on 8/24/26.
//

import SwiftUI

enum ResultCheck: String, Identifiable, CaseIterable {
    case number, url, even, negative, wholeNumber
    var id: String { return self.rawValue }
    
    var label: LocalizedStringKey {
        switch self {
        case .even:
            "Is it even?"
        case .negative:
            "Is it negative?"
        case .number:
            "Is it a number?"
        case .url:
            "Is it a URL?"
        case .wholeNumber:
            "Is it a whole number?"
        }
    }

    func isTrue(code: String) -> Bool {
        switch self {
        case .even:
            return code.isEven
        case .negative:
            return code.isNegative
        case .number:
            return code.isNumber
        case .url:
            return code.isUrl
        case .wholeNumber:
            return code.isWholeNumber
        }
    }
}
