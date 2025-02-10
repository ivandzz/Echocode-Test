//
//  BigButton.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 10.02.2025.
//

import SwiftUI

struct BigButton: View {
    
    let text: String
    let iconName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.customBlue)
                    .frame(width: 291, height: 51)
                    .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 4)
                
                if UIImage(systemName: iconName) != nil {
                    Label(text, systemImage: iconName)
                        .font(.custom("KonkhmerSleokchher-Regular", size: 12))
                        .foregroundColor(Color.customDarkBlue)
                } else {
                    Label(text, image: iconName)
                        .font(.custom("KonkhmerSleokchher-Regular", size: 12))
                        .foregroundColor(Color.customDarkBlue)
                }
            }
        }
    }
}

#Preview("Custom image asset") {
    BigButton(text: "Button", iconName: "ic-rotate", action: {})
}

#Preview("System image") {
    BigButton(text: "Button", iconName: "paperplane", action: {})
}
