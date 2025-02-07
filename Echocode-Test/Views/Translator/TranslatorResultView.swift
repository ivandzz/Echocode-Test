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
    
    var body: some View {
        ZStack {
            BackgroundGradient()
            
            VStack(spacing: 20) {
                ZStack {
                    HStack {
                        Button(action: {
                            dismiss()
                        }, label: {
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 40, height: 40)
                                
                                Image(systemName: "xmark.circle")
                                    .imageScale(.large)
                                    .foregroundStyle(.black)
                            }
                        })
                        
                        Spacer()
                    }
                    .padding()
                    
                    Text("Result")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
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
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.customBlue)
                                .frame(width: 280, height: 50)
                            
                            Label("Repeat", systemImage: "arrow.clockwise")
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                        }
                    }
                    .padding(.top, 235)
                    .padding(.bottom, 50)
                }
                
                Image(viewModel.selectedPet.imageName)
                    .resizable()
                    .frame(width: 185, height: 185)
                
                Spacer()
                
            }
        }
        .onAppear {
            if viewModel.isHumanToPet {
                soundName = viewModel.selectedPet.imageName + String(Int.random(in: 1...3))
                SoundManager.shared.playSound(named: soundName) { error in
                    if let error {
                        print("Error playing sound: \(error.localizedDescription)")
                    }
                }}
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
