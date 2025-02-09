//
//  PetSelectionButton.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import SwiftUI

struct PetSelectionButton: View {
    
    //MARK: - Properties
    let color: Color
    let imageName: String
    let overlayOpacity: Double
    let action: () -> Void
    
    //MARK: - Body
    var body: some View {
        Button(action: action) {
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
}

#Preview {
    PetSelectionButton(color: .customBlue, imageName: "cat", overlayOpacity: 0, action: {})
}
