//
//  StoreManager.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 11.02.2025.
//

import StoreKit

final class StoreManager {
    
    static let shared = StoreManager()
    
    private init() {}
    
    @MainActor
    func restorePurchases() async -> PurchaseStatus {
        do {
            var purchaseIDs: [String] = []
            
            for await result in Transaction.currentEntitlements {
                let transaction = try result.payloadValue
                purchaseIDs.append(transaction.productID)
                
                await transaction.finish()
            }
            
            return purchaseIDs.isEmpty ? .noPurchasesFound : .success
            
        } catch {
            return .restorationFailed(error.localizedDescription)
        }
    }
}
