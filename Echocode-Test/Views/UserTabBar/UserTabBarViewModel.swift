//
//  UserTabBarViewModel.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 08.02.2025.
//

import Foundation

final class UserTabBarViewModel: ObservableObject {
    
    //MARK: - Published properties
    @Published var selectedTab = 0
    @Published var isTabBarHidden = false
    
    //MARK: - Types
    enum Tab {
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
        
        var tag: Int {
            switch self {
            case .translator:
                return 0
            case .clicker:
                return 1
            }
        }
    }
}
