//
//  TranslationSwitch.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import SwiftUI

struct TranslationSwitch: View {
    
    @Binding var isHumanToPet: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            Text(isHumanToPet ? "HUMAN" : "PET")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isHumanToPet.toggle()
                }
            } label: {
                Image(systemName: "arrow.left.arrow.right")
                    .font(.system(size: 20))
                    .foregroundStyle(.black)
            }
            .frame(maxWidth: .infinity)
            
            Text(isHumanToPet ? "PET" : "HUMAN")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            Spacer()
        }
        .frame(width: 250, height: 60) 
        .padding(.bottom, 40)
    }
}

#Preview {
    TranslationSwitch(isHumanToPet: .constant(true))
}
