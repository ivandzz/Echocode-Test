//
//  TranslatorResultView.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 07.02.2025.
//

import SwiftUI

struct TranslatorResultView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: TranslatorResultViewModel
    
    var body: some View {
        ZStack {
            BackgroundGradient()
            
            VStack {
                ZStack {
                    HStack {
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                viewModel.isShowing = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    dismiss()
                                }
                            }
                        }, label: {
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 48, height: 48)
                                
                                Image("ic-close")
                            }
                            .shadow(color: .customShadowColor, radius: 60, y: 20)
                            
                        })
                        .offset(x: viewModel.isShowing ? 0 : -100)
                        .animation(.spring(response: 0.6, dampingFraction: 0.7), value: viewModel.isShowing)
                        
                        Spacer()
                    }
                    .padding(.top, 17)
                    .padding(.horizontal)
                    
                    Text("Result")
                        .font(.custom("KonkhmerSleokchher-Regular", size: 32))
                        .foregroundStyle(Color.customDarkBlue)
                        .frame(width: 350, height: 58)
                        .padding(.top, 12)
                        .opacity(viewModel.isShowing ? 1 : 0)
                        .offset(y: viewModel.isShowing ? 0 : -20)
                        .transition(.move(edge: .top).combined(with: .opacity))
                }
                
                if viewModel.isHumanToPet {
                    Button {
                        viewModel.playSound()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.customBlue)
                                .frame(width: 291, height: 51)
                                .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 4)
                            
                            Label("Repeat", image: "ic-rotate")
                                .font(.custom("KonkhmerSleokchher-Regular", size: 12))
                                .foregroundColor(Color.customDarkBlue)
                        }
                    }
                    .padding(.top, 179)
                    .padding(.bottom, 138)
                    .scaleEffect(viewModel.isShowing ? 1 : 0.5)
                    .opacity(viewModel.isShowing ? 1 : 0)
                    .animation(.spring(response: 0.6, dampingFraction: 0.7).delay(0.3), value: viewModel.isShowing)
                } else {
                    
                }
                
                Image(viewModel.selectedPet.imageName)
                    .resizable()
                    .frame(width: 186, height: 186)
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
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                viewModel.isShowing = true
            }
            
            viewModel.onAppear()
        }
        .onDisappear {
            viewModel.onDisappear()
        }
    }
}

#Preview {
    TranslatorResultView(viewModel: TranslatorResultViewModel(isHumanToPet: true,
                                                              selectedPet: TranslatorViewModel.Pet.dog,
                                                                onDismiss: {}))
                                                                
}
