//
//  BackgroundGradient.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import SwiftUI

struct BackgroundGradient: View {
    
    let colors: [Color]
    
    init(colors: [Color] = [.backgroundCyan, .backgroundYellow]) {
        self.colors = colors
    }
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundGradient()
}
