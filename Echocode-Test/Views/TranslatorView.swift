//
//  TranslatorView.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import SwiftUI

struct TranslatorView: View {
    var body: some View {
        ZStack {
            BackgroundGradient()
            
            VStack(spacing: 15) {
                Text("Translator")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                HStack(spacing: 50) {
                    Text("HUMAN")
                        .fontWeight(.bold)
                    
                    Image(systemName: "arrow.left.arrow.right")
                    
                    Text("PET")
                        .fontWeight(.bold)
                }
                .padding(.vertical, 15)
                
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
                            
                            Text("Start Speak")
                                .fontWeight(.bold)
                                .padding()
                        }
                        .frame(width: 176, height: 176)
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 105, height: 175)
                            .foregroundStyle(.white)
                            .shadow(radius: 15)
                        
                        VStack(spacing: 10) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 70, height: 70)
                                    .foregroundStyle(Color.customBlue)
                                
                                Image("cat")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 70, height: 70)
                                    .foregroundStyle(Color.customYellow)
                                
                                Image("dog")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                        }
                    }
                }
                .padding(.vertical, 50)
                
                Image("dog")
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
