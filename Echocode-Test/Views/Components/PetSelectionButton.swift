//
//  PetSelectionButton.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import SwiftUI

struct PetSelectionButton: View {
    
    let color: Color
    let imageName: String
    let overlayOpacity: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 70, height: 70)
                .foregroundStyle(color)
            
            Image(imageName)
                .resizable()
                .frame(width: 40, height: 40)
            
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 70, height: 70)
                .foregroundStyle(.white)
                .opacity(overlayOpacity)
        }
    }
}

#Preview {
    PetSelectionButton(color: .customBlue, imageName: "cat", overlayOpacity: 0)
}
