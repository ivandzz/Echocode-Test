//
//  TranslatorView.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import SwiftUI

struct TranslatorView: View {
    
    @StateObject var viewModel = TranslatorViewModel()
    
    var body: some View {
        ZStack {
            BackgroundGradient()
            
            VStack(spacing: 20) {
                Text("Translator")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                TranslationSwitch(isHumanToPet: $viewModel.isHumanToPet)
                    .padding(.bottom, 40)
                
                HStack(spacing: 35) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 175, height: 175)
                            .foregroundStyle(.white)
                            .shadow(radius: 15)
                        
                        Button {
                            if viewModel.isHumanToPet {
                                viewModel.startSpeaking()
                            } else {
                                //                                viewModel.startRecording()
                            }
                        } label: {
                            VStack(spacing: 10) {
                                Spacer()
                                
                                Image(systemName: "mic")
                                    .resizable()
                                    .frame(width: 50, height: 70)
                                
                                Text(viewModel.isHumanToPet ? "Start Speak" : "Start Record")
                                    .fontWeight(.bold)
                                    .padding()
                            }
                            .foregroundStyle(.black)
                            .frame(width: 175, height: 175)
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 105, height: 175)
                            .foregroundStyle(.white)
                            .shadow(radius: 15)
                        
                        VStack(spacing: 10) {
                            Button {
                                viewModel.selectedPet = .cat
                            } label: {
                                PetSelectionButton(color: .customBlue, imageName: "cat", overlayOpacity: viewModel.getOverlayOpacity(for: .cat))
                            }
                            
                            Button {
                                viewModel.selectedPet = .dog
                            } label: {
                                PetSelectionButton(color: .customYellow, imageName: "dog", overlayOpacity: viewModel.getOverlayOpacity(for: .dog))
                            }
                        }
                    }
                }
                .padding(.bottom, 50)
                
                Image(viewModel.selectedPet.imageName)
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
