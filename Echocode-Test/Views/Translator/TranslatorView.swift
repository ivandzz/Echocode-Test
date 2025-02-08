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
                
                VStack {
                    if !viewModel.isTranslating {
                        Group {
                            Text("Translator")
                                .font(.custom("KonkhmerSleokchher-Regular", size: 32))
                                .foregroundStyle(Color.customDarkBlue)
                                .frame(width: 350, height: 58)
                                .padding(.vertical, 12)
                                .transition(.move(edge: .top).combined(with: .opacity))
                            
                            TranslationSwitch(isHumanToPet: $viewModel.isHumanToPet)
                                .padding(.bottom, 58)
                                .disabled(viewModel.isRecording)
                                .transition(.move(edge: .top).combined(with: .opacity))
                            
                            HStack(spacing: 35) {
                                recordingButton
                                
                                petSelectionView
                            }
                            .padding(.bottom, 51)
                            .transition(.move(edge: .top).combined(with: .opacity))
                        }
                    } else {
                        Text("Process of translation...")
                            .font(.custom("KonkhmerSleokchher-Regular", size: 16))
                            .frame(height: 22)
                            .padding(.bottom, 78)
                            .padding(.top, 343)
                            .transition(.asymmetric(
                                insertion: .scale.combined(with: .opacity),
                                removal: .scale.combined(with: .opacity)
                            ))
                    }
                    
                    Image(viewModel.selectedPet.imageName)
                        .resizable()
                        .frame(width: 184, height: 184)
                        .padding(.bottom, 134)
                        .scaleEffect(viewModel.isTranslating ? 1.1 : 1.0)
                }
            }
            .animation(.easeInOut(duration: 0.5), value: viewModel.isTranslating)
            .navigationDestination(for: TranslatorViewModel.Pet.self) { pet in
                TranslatorResultView(viewModel: viewModel)
                    .navigationBarBackButtonHidden()
            }
        }
    }
    
    private var recordingButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 176, height: 176)
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.25), radius: 14.3, x: 0, y: 4)
            
            if viewModel.isRecording {
                VStack {
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
                    .padding(.bottom, 54)
                    
                    Text("Recording...")
                        .font(.custom("KonkhmerSleokchher-Regular", size: 16))
                        .frame(width: 138, height: 22)
                        .padding(.bottom, 16)
                }
                .foregroundStyle(Color.customDarkBlue)
                .frame(width: 175, height: 175)
                .transition(.opacity.combined(with: .scale))
            } else {
                VStack {
                    Spacer()
                    
                    Image("ic-mic")
                        .padding(.bottom, 24)
                    
                    Text("Start Speak")
                        .font(.custom("KonkhmerSleokchher-Regular", size: 16))
                        .frame(width: 138, height: 22)
                        .padding(.bottom, 16)
                }
                .foregroundStyle(Color.customDarkBlue)
                .frame(width: 175, height: 175)
                .transition(.opacity.combined(with: .scale))
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                if viewModel.isRecording {
                    viewModel.stopSpeaking()
                } else {
                    viewModel.startSpeaking()
                }
            }
        }
    }
    
    private var petSelectionView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 105, height: 175)
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.25), radius: 14.3, x: 0, y: 4)
            
            VStack(spacing: 10) {
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                        viewModel.selectedPet = .cat
                    }
                } label: {
                    PetSelectionButton(color: .customBlue,
                                     imageName: "cat",
                                     overlayOpacity: viewModel.getOverlayOpacity(for: .cat))
                }
                
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                        viewModel.selectedPet = .dog
                    }
                } label: {
                    PetSelectionButton(color: .customYellow,
                                     imageName: "dog",
                                     overlayOpacity: viewModel.getOverlayOpacity(for: .dog))
                }
            }
            .disabled(viewModel.isRecording)
        }
    }
}
#Preview {
    TranslatorView(viewModel: TranslatorViewModel())
}
