//
//  Double+Exetensions.swift
//  IsTheBarcodeBlank
//
//  Created by Danielle Cushing1 on 8/24/26.
//

import Foundation

extension Double {
    var isEven: Bool { return self.truncatingRemainder(dividingBy: 2.0) == 0 }
    var isNegative: Bool { return self.isLess(than: 0.0) }
}
