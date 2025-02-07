//
//  TranslatorView.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import SwiftUI

struct TranslatorView: View {
    
    @ObservedObject var viewModel: TranslatorViewModel
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            ZStack {
                BackgroundGradient()
                
                VStack(spacing: 20) {
                    Text("Translator")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .opacity(viewModel.isTranslating ? 0 : 1)
                        .animation(.easeInOut(duration: 0.3), value: viewModel.isTranslating)
                    
                    TranslationSwitch(isHumanToPet: $viewModel.isHumanToPet)
                        .padding(.bottom, 40)
                        .disabled(viewModel.isRecording)
                        .opacity(viewModel.isTranslating ? 0 : 1)
                        .animation(.easeInOut(duration: 0.3), value: viewModel.isTranslating)
                    
                    HStack(spacing: 35) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 175, height: 175)
                                .foregroundStyle(.white)
                                .shadow(radius: 15)
                            
                            if viewModel.isRecording {
                                VStack(spacing: 10) {
                                    Spacer()
                                    
                                    HStack(spacing: 5) {
                                        ForEach(0..<25) { item in
                                            RoundedRectangle(cornerRadius: 2)
                                                .frame(width: 1, height: .random(in: 10...30))
                                                .foregroundStyle(.blue)
                                                .animation(
                                                    .easeInOut(duration: 0.4)
                                                    .repeatForever()
                                                    .delay(Double(item) * 0.02),
                                                    value: viewModel.isAnimating
                                                )
                                        }
                                        .onAppear {
                                            viewModel.isAnimating.toggle()
                                        }
                                    }
                                    .padding(.bottom, 10)
                                    
                                    Text("Recording...")
                                        .fontWeight(.bold)
                                        .padding()
                                }
                                .foregroundStyle(.black)
                                .frame(width: 175, height: 175)
                            } else {
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
                        .onTapGesture {
                            if viewModel.isRecording {
                                viewModel.stopSpeaking()
                            } else {
                                viewModel.startSpeaking()
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
                            .disabled(viewModel.isRecording)
                        }
                    }
                    .opacity(viewModel.isTranslating ? 0 : 1)
                    .animation(.easeInOut(duration: 0.3), value: viewModel.isTranslating)
                    
                    Text("Process of translation...")
                        .fontWeight(.bold)
                        .padding(.bottom, 50)
                        .padding(.top, -50)
                        .opacity(viewModel.isTranslating ? 1 : 0)
                        .transition(.opacity.combined(with: .move(edge: .top)))
                        .animation(.easeInOut(duration: 0.5), value: viewModel.isTranslating)
                    
                    Image(viewModel.selectedPet.imageName)
                        .resizable()
                        .frame(width: 185, height: 185)
                    
                    Spacer()
                }
            }
            .navigationDestination(for: TranslatorViewModel.Pet.self) { pet in
                TranslatorResultView(viewModel: viewModel, pet: pet)
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    TranslatorView(viewModel: TranslatorViewModel())
}
