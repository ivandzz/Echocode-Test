//
//  TranslatorView.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import SwiftUI

struct TranslatorView: View {
    
    @State private var isDogSelected = true
    @State private var isHumanToPet = true
    
    var body: some View {
        ZStack {
            BackgroundGradient()
            
            VStack(spacing: 15) {
                Text("Translator")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                TranslationSwitch(isHumanToPet: $isHumanToPet)
                
                HStack(spacing: 35) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 175, height: 175)
                            .foregroundStyle(.white)
                            .shadow(radius: 15)
                        
                        VStack(spacing: 10) {
                            Spacer()
                            
                            Image(systemName: "mic")
                                .resizable()
                                .frame(width: 50, height: 70)
                            
                            Text(isHumanToPet ? "Start Speak" : "Start Record")
                                .fontWeight(.bold)
                                .padding()
                        }
                        .frame(width: 175, height: 175)
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 105, height: 175)
                            .foregroundStyle(.white)
                            .shadow(radius: 15)
                        
                        VStack(spacing: 10) {
                            Button {
                                isDogSelected = false
                            } label: {
                                PetSelectionButton(color: .customBlue, imageName: "cat", overlayOpacity: isDogSelected ? 0.5 : 0)
                            }
                            
                            Button {
                                isDogSelected = true
                            } label: {
                                PetSelectionButton(color: .customYellow, imageName: "dog", overlayOpacity: isDogSelected ? 0 : 0.5)
                            }
                        }
                    }
                }
                .padding(.vertical, 50)
                
                Image(isDogSelected ? "dog" : "cat")
                    .resizable()
                    .frame(width: 185, height: 185)
                
                Spacer()
            }
        }
    }
}

#Preview {
    TranslatorView()
}
