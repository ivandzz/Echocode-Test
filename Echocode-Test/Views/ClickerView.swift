//
//  ClickerView.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import SwiftUI

struct ClickerView: View {
    var body: some View {
        ZStack {
            BackgroundGradient()
            
            VStack {
                MainTitle("Settings")
                    .padding(.vertical, 12)
            }
        }
    }
}

#Preview {
    ClickerView()
}
