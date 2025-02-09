//
//  BackgroundGradient.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import SwiftUI

struct BackgroundGradient: View {
    
    //MARK: - Properties
    let colors: [Color]
    
    //MARK: - Init
    init(colors: [Color] = [.backgroundCyan, .backgroundYellow]) {
        self.colors = colors
    }
    
    //MARK: - Body
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundGradient()
}
