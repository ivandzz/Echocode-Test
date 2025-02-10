//
//  TranslatorResultView.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 07.02.2025.
//

import SwiftUI

struct TranslatorResultView: View {
    
    //MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: TranslatorResultViewModel
    
    //MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradient()
            
            VStack {
                headerView
                
                if viewModel.isHumanToPet {
                    repeatButton
                } else {
                    speechBubble
                }
                
                Image(viewModel.selectedPet.imageName)
                    .resizable()
                    .frame(width: 184, height: 184)
                    .padding(.bottom, 134)
                    .offset(y: viewModel.isShowing ? 0 : 100)
                    .opacity(viewModel.isShowing ? 1 : 0)
                    .rotation3DEffect(
                        .degrees(viewModel.isShowing ? 0 : 30),
                        axis: (x: 1, y: 0, z: 0)
                    )
                    .animation(.spring(response: 0.6, dampingFraction: 0.7).delay(0.4), value: viewModel.isShowing)
            }
        }
        .alert(isPresented: $viewModel.isShowingAlert, error: viewModel.error, actions: {
            Button("Try Again") {
                viewModel.error = nil
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { 
                    viewModel.playSound()
                }
            }
            Button("Cancel", role: .cancel) {
                viewModel.error = nil
            }
        })
        .onAppear(perform: viewModel.onAppear)
        .onDisappear(perform: viewModel.onDisappear)
    }
    
    //MARK: - Header view
    private var headerView: some View {
        ZStack {
            HStack {
                CloseButton {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        viewModel.isShowing = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            dismiss()
                        }
                    }
                }
                .offset(x: viewModel.isShowing ? 0 : -100)
                .animation(.spring(response: 0.6, dampingFraction: 0.7), value: viewModel.isShowing)
                
                Spacer()
            }
            .padding(.top, 17)
            .padding(.horizontal)
            
            MainTitle("Result")
                .padding(.top, 12)
                .opacity(viewModel.isShowing ? 1 : 0)
                .offset(y: viewModel.isShowing ? 0 : -20)
                .transition(.move(edge: .top).combined(with: .opacity))
        }
    }
    
    //MARK: - Repeat button
    private var repeatButton: some View {
        BigButton(text: "Repeat", iconName: "ic-rotate", action: {
            viewModel.playSound()
        })
        .padding(.top, 179)
        .padding(.bottom, 136)
        .scaleEffect(viewModel.isShowing ? 1 : 0.5)
        .opacity(viewModel.isShowing ? 1 : 0)
        .animation(.spring(response: 0.6, dampingFraction: 0.7).delay(0.3), value: viewModel.isShowing)
    }
    
    //MARK: - Speech bubble
    private var speechBubble: some View {
        ZStack {
            // Placeholder rectangle with shadow
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .frame(width: 291, height: 142)
                .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 4)
            
            PolygonShape()
                .fill(Color.customBlue)
                .frame(width: 12, height: 169.95)
                .rotationEffect(.degrees(33.38))
                .offset(x: 95, y: 105)
                .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 4)
            
            // Actual rectangle without shadow for better look
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.customBlue)
                .frame(width: 291, height: 142)
            
            Text(viewModel.translatedText)
                .font(.custom("KonkhmerSleokchher-Regular", size: 12))
                .foregroundStyle(Color.customDarkBlue)
        }
        .padding(.top, 91)
        .padding(.bottom, 105)
        .scaleEffect(viewModel.isShowing ? 1 : 0.5)
        .opacity(viewModel.isShowing ? 1 : 0)
        .animation(.spring(response: 0.6, dampingFraction: 0.7).delay(0.3), value: viewModel.isShowing)
    }
}

#Preview("Human to Pet") {
    TranslatorResultView(viewModel: TranslatorResultViewModel(isHumanToPet: false,
                                                              selectedPet: .dog,
                                                              onDismiss: {}))
}

#Preview("Pet to Human") {
    TranslatorResultView(viewModel: TranslatorResultViewModel(isHumanToPet: true,
                                                              selectedPet: .cat,
                                                              onDismiss: {}))
}
