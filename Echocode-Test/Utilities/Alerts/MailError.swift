//
//  MailError.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 10.02.2025.
//

import Foundation

enum MailError: LocalizedError {
    case emptyFields
    case invalidEmail
    case mailUnavailable
    
    var errorDescription: String? {
        switch self {
        case .emptyFields:
            return "Please fill in all fields."
        case .invalidEmail:
            return "Please enter a valid email address."
        case .mailUnavailable:
            return "Mail services are not available. Please configure your email account."
        }
    }
}
