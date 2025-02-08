//
//  TranslatorResultView.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 07.02.2025.
//

import SwiftUI

struct TranslatorResultView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: TranslatorViewModel
    @State private var soundName: String = ""
    @State private var isShowing = false
    
    var body: some View {
        ZStack {
            BackgroundGradient()
            
            VStack {
                ZStack {
                    HStack {
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                isShowing = false
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
                            .shadow(color: .customShadowColor, radius: 60, x: 0, y: 20)
                            
                        })
                        .offset(x: isShowing ? 0 : -100)
                        .animation(.spring(response: 0.6, dampingFraction: 0.7), value: isShowing)
                        
                        Spacer()
                    }
                    .padding(.top, 17)
                    .padding(.horizontal)
                    
                    Text("Result")
                        .font(.custom("KonkhmerSleokchher-Regular", size: 32))
                        .foregroundStyle(Color.customDarkBlue)
                        .frame(width: 350, height: 58)
                        .padding(.top, 12)
                        .opacity(isShowing ? 1 : 0)
                        .offset(y: isShowing ? 0 : -20)
                        .transition(.move(edge: .top).combined(with: .opacity))
                }
                
                if viewModel.isHumanToPet {
                    Button {
                        SoundManager.shared.stopSound()
                        
                        SoundManager.shared.playSound(named: soundName) { error in
                            if let error {
                                print("Error playing sound: \(error.localizedDescription)")
                            }
                        }
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
                    .scaleEffect(isShowing ? 1 : 0.5)
                    .opacity(isShowing ? 1 : 0)
                    .animation(.spring(response: 0.6, dampingFraction: 0.7).delay(0.3), value: isShowing)
                } else {
                    
                }
                
                Image(viewModel.selectedPet.imageName)
                    .resizable()
                    .frame(width: 186, height: 186)
                    .padding(.bottom, 134)
                    .offset(y: isShowing ? 0 : 100)
                    .opacity(isShowing ? 1 : 0)
                    .rotation3DEffect(
                        .degrees(isShowing ? 0 : 30),
                        axis: (x: 1, y: 0, z: 0)
                    )
                    .animation(.spring(response: 0.6, dampingFraction: 0.7).delay(0.4), value: isShowing)
                
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isShowing = true
            }
            
            if viewModel.isHumanToPet {
                soundName = viewModel.selectedPet.imageName + String(Int.random(in: 1...3))
                SoundManager.shared.playSound(named: soundName) { error in
                    if let error {
                        print("Error playing sound: \(error.localizedDescription)")
                    }
                }
            }
        }
        .onDisappear {
            viewModel.isShowingResult = false
            
            SoundManager.shared.stopSound()
        }
    }
}

#Preview {
    TranslatorResultView(viewModel: TranslatorViewModel())
}
