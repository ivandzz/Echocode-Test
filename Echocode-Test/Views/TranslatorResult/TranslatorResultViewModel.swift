//
//  TranslatorResultViewModel.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 08.02.2025.
//

import Foundation

final class TranslatorResultViewModel: ObservableObject {
    
    @Published var soundName: String = ""
    @Published var showContent: Bool = false
    @Published var isShowing: Bool = false
    
    let isHumanToPet: Bool
    let selectedPet: TranslatorViewModel.Pet
    let onDismiss: () -> Void
    
    init(isHumanToPet: Bool,
         selectedPet: TranslatorViewModel.Pet,
         onDismiss: @escaping () -> Void) {
        
        self.isHumanToPet = isHumanToPet
        self.selectedPet = selectedPet
        self.onDismiss = onDismiss
        
        if isHumanToPet {
            self.soundName = selectedPet.imageName + String(Int.random(in: 1...3))
        } else {
            
        }
    }
    
    func playSound() {
        SoundManager.shared.stopSound()
        
        SoundManager.shared.playSound(named: soundName) { error in
            if let error {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
    
    func onAppear() {
        if isHumanToPet {
            playSound()
        } else {
            
        }
    }
    
    func onDisappear() {
        if isHumanToPet {
            SoundManager.shared.stopSound()
        }
        
        onDismiss()
    }
}
