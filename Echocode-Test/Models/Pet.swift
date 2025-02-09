//
//  Pet.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 09.02.2025.
//

import Foundation

enum Pet {
    case cat, dog
    
    var imageName: String {
        switch self {
        case .cat:
            return "cat"
        case .dog:
            return "dog"
        }
    }
}
