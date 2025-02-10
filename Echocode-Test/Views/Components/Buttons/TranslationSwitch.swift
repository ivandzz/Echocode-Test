//
//  TranslationSwitch.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import SwiftUI

struct TranslationSwitch: View {
    
    //MARK: - Variables
    @Binding var isHumanToPet: Bool
    
    //MARK: - Body
    var body: some View {
        HStack() {
            CommonText(isHumanToPet ? "HUMAN" : "PET")
                .frame(maxWidth: .infinity, alignment: .center)
            
            Button {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isHumanToPet.toggle()
                }
            } label: {
                Image("ic-swap")
            }
            .frame(maxWidth: .infinity)
            
            CommonText(isHumanToPet ? "PET" : "HUMAN")
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .shadow(color: Color(hex: "#191C321A"), radius: 30, x: 0, y: 20)
    }
}

#Preview {
    TranslationSwitch(isHumanToPet: .constant(true))
}
