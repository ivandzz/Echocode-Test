//
//  CloseButton.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 09.02.2025.
//

import SwiftUI

struct CloseButton: View {
    
    //MARK: - Properties
    let action: () -> Void
    
    //MARK: - Body
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 48, height: 48)
                
                Image("ic-close")
            }
            .shadow(color: .customShadowColor, radius: 60, y: 20)
        }
    }
}

#Preview {
    CloseButton(action: {})
}
