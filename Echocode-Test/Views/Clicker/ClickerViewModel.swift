//
//  ClickerViewModel.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 10.02.2025.
//

import StoreKit

final class ClickerViewModel: ObservableObject {
    
    //MARK: - Published properties
    @Published var isShowingContactUs = false
    @Published var isShowingRestoreAlert = false
    @Published var isRestoring = false
    @Published var restoreStatus: PurchaseStatus?
    @Published var isShowingPrivacyPolicy = false
    @Published var isShowingTermsOfUse = false
    
    //MARK: - Properties
    var isTabBarHidden: (Bool) -> Void
    
    //MARK: - Init
    init(isTabBarHidden: @escaping (Bool) -> Void) {
        self.isTabBarHidden = isTabBarHidden
    }
    
    //MARK: - Methods
    @MainActor
    func restorePurchases() async {
        isRestoring = true
        defer { isRestoring = false }
        
        restoreStatus = await StoreManager.shared.restorePurchases()
        isShowingRestoreAlert = true
    }
}
