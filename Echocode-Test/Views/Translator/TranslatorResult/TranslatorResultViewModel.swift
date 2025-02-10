//
//  TranslatorResultViewModel.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 08.02.2025.
//

import SwiftUI

final class TranslatorResultViewModel: ObservableObject {
    
    //MARK: - Published properties
    @Published var soundName: String = ""
    @Published var translatedText: String = ""
    
    @Published var isShowing: Bool = false
    
    @Published var isShowingAlert: Bool = false
    @Published var error: SoundError?
    
    //MARK: - Properties
    let isHumanToPet: Bool
    let selectedPet: Pet
    let onDismiss: () -> Void

    //MARK: - Init
    init(isHumanToPet: Bool,
         selectedPet: Pet,
         onDismiss: @escaping () -> Void) {
        
        self.isHumanToPet = isHumanToPet
        self.selectedPet = selectedPet
        self.onDismiss = onDismiss
        
        if isHumanToPet {
            self.soundName = selectedPet.imageName + String(Int.random(in: 1...3))
        } else {
            translatedText = PetPhrases.getRandomPhrase(for: selectedPet)
        }
    }
    
    //MARK: - Methods
    func playSound() {
        SoundManager.shared.stopSound()
        
        SoundManager.shared.playSound(named: soundName) { error in
            if let error {
                self.error = SoundError.playbackFailed(error)
                self.isShowingAlert = true
            }
        }
    }

    func onAppear() {
        withAnimation(.easeOut(duration: 0.5)) {
            isShowing = true
        }
        
        if isHumanToPet {
            playSound()
        }
    }
    
    func onDisappear() {
        if isHumanToPet {
            SoundManager.shared.stopSound()
        }
        
        onDismiss()
    }
}
