//
//  PurchaseStatus.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 10.02.2025.
//

import Foundation

enum PurchaseStatus: LocalizedError, Equatable {
    case success
    case noPurchasesFound
    case restorationFailed(String)
    
    var message: String {
        switch self {
        case .success:
            return "Your purchases have been restored successfully!"
        case .noPurchasesFound:
            return "No purchases found to restore."
        case .restorationFailed(let errorMessage):
            return "Failed to restore purchases: \(errorMessage)"
        }
    }
}
