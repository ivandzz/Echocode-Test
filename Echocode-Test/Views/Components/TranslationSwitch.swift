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
        HStack() {
            Text(isHumanToPet ? "HUMAN" : "PET")
                .font(.custom("KonkhmerSleokchher-Regular", size: 16))
                .frame(maxWidth: .infinity, alignment: .center)
            
            Button {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isHumanToPet.toggle()
                }
            } label: {
                Image("ic-swap")
            }
            .frame(maxWidth: .infinity)
            
            Text(isHumanToPet ? "PET" : "HUMAN")
                .font(.custom("KonkhmerSleokchher-Regular", size: 16))
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .frame(width: 310, height: 61)
        .foregroundStyle(Color.customDarkBlue)
        .shadow(color: Color(hex: "#191C321A"), radius: 30, x: 0, y: 20)
    }
}

#Preview {
    TranslationSwitch(isHumanToPet: .constant(true))
}
