//
//  ResultCheck.swift
//  IsTheBarcodeBlank
//
//  Created by Danielle Cushing on 8/24/26.
//

import SwiftUI

enum ResultCheck: String, Identifiable, CaseIterable {
    case number, url
    var id: String { return self.rawValue }
    
    var label: LocalizedStringKey {
        switch self {
        case .number:
            "Is it a number?"
        case .url:
            "Is it a URL?"
        }
    }

    func isTrue(code: String) -> Bool {
        switch self {
        case .number:
            return code.isNumber
        case .url:
            return code.isUrl
        }
    }
}
