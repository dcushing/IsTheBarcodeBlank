//
//  Bool+Extensions.swift
//  IsTheBarcodeBlank
//
//  Created by Danielle Cushing on 8/24/26.
//

import Foundation
import SwiftUI

extension Bool {
    var localizedLabel: LocalizedStringKey {
        return self == true ? "Yes!" : "No"
    }
}
