//
//  UserTabBarViewModel.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 08.02.2025.
//

import Foundation

final class UserTabBarViewModel: ObservableObject {
    
    @Published var selectedTab = 0
    @Published var isTabBarHidden = false
    
    enum Tabs {
        case translator
        case clicker
        
        var title: String {
            switch self {
            case .translator:
                return "Translator"
            case .clicker:
                return "Clicker"
            }
        }
        
        var image: String {
            switch self {
            case .translator:
                return "ic-messages"
            case .clicker:
                return "ic-gear"
            }
        }
    }
}
