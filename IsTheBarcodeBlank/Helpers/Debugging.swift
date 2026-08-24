//
//  Debugging.swift
//  IsTheBarcodeBlank
//
//  Created by Danielle Cushing on 8/24/26.
//

protocol Debuggable {
    var name: String { get }
    func log(_ val: Any)
}

extension Debuggable {
    var name: String { String(describing: self) }
    
    func log(_ val: Any) {
        #if DEBUG
        print("\(name): \(val)")
        #endif
    }
}
