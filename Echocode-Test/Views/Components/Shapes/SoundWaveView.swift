//
//  SoundWaveView.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 11.02.2025.
//

import SwiftUI

struct SoundWaveView: View {
    
    @State var isAnimating = false
    
    var body: some View {
        HStack(spacing: 5) {
            ForEach(0..<25) { item in
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 1, height: .random(in: 10...30))
                    .foregroundStyle(.blue)
                    .animation(
                        .easeInOut(duration: 0.4)
                        .repeatForever()
                        .delay(Double(item) * 0.02),
                        value: isAnimating
                    )
            }
            .onAppear {
                isAnimating.toggle()
            }
        }
    }
}

#Preview {
    SoundWaveView()
}
