//
//  TabBarButton.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 09.02.2025.
//

import SwiftUI

struct TabBarButton: View {
    
    //MARK: - Properties
    let tab: UserTabBarViewModel.Tab
    @Binding var selectedTab: Int
    
    //MARK: - Body
    var body: some View {
        Button {
            selectedTab = tab.tag
        } label: {
            VStack(spacing: 4) {
                Image(tab.image)
                    .opacity(selectedTab == tab.tag ? 1 : 0.5)
                
                CommonText(tab.title)
                    .opacity(selectedTab == tab.tag ? 1 : 0.5)
            }
        }

    }
}

#Preview {
    TabBarButton(tab: .translator, selectedTab: .constant(0))
}
