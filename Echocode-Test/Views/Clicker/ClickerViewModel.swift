//
//  ClickerViewModel.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 10.02.2025.
//

import Foundation

final class ClickerViewModel: ObservableObject {
    
    //MARK: - Published properties
    @Published var isShowingContactUs = false
    
    //MARK: - Properties
    var isTabBarHidden: (Bool) -> Void
    
    //MARK: - Init
    init(isTabBarHidden: @escaping (Bool) -> Void) {
        self.isTabBarHidden = isTabBarHidden
    }
}
