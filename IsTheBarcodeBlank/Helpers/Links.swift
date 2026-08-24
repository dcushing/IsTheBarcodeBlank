//
//  Links.swift
//  IsTheBarcodeBlank
//
//  Created by Danielle Cushing on 8/24/26.
//

import Foundation

enum Links: String, Equatable, Identifiable {
    case githubProject = "Github"
    case issues = "Issues"

    var id: String { return self.rawValue }
    
    var urlString: String {
        switch self {
        case .githubProject:
            return "https://github.com/dcushing/IsTheBarcodeBlank"
        case .issues:
            return "https://github.com/dcushing/IsTheBarcodeBlank/issues"
        }
    }

    var url: URL {
        return URL(string: self.urlString)!
    }
}
