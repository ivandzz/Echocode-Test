//
//  SettingsListButton.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 10.02.2025.
//

import SwiftUI

struct SettingsButtonLabel: View {
    
    let text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.customBlue)
            HStack {
                Text(text)
                    .font(.custom("KonkhmerSleokchher-Regular", size: 16))
                    .foregroundStyle(Color.customDarkBlue)
                
                Spacer()
                
                Image("ic-arrow")
            }
            .frame(maxWidth: .infinity, minHeight: 50)
            .padding(.horizontal, 16)
        }
        .padding(.horizontal, 16)
    }
}

struct SettingsButton: View {
    
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            SettingsButtonLabel(text: text)
        }
    }
}

#Preview {
    SettingsButton(text: "Button") { }
        .frame(height: 50)
}
