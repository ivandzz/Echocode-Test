//
//  BackgroundGradient.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import SwiftUI

struct BackgroundGradient: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.white, .customYellow]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundGradient()
}
