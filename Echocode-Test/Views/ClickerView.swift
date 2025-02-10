//
//  ClickerView.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import SwiftUI
import StoreKit

struct ClickerView: View {
    
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        ZStack {
            BackgroundGradient()
            
            VStack {
                MainTitle("Settings")
                    .padding(.vertical, 12)
                
                List {
                    Button(action: {
                        requestReview()
                    }, label: {
                        SettingsListButton(text: "Rate Us")
                    })
                    .padding(.bottom, 14)
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
        }
    }
}

#Preview {
    ClickerView()
}
