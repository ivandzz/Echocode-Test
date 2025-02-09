//
//  TranslatorResultViewModel.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 08.02.2025.
//

import Foundation

final class TranslatorResultViewModel: ObservableObject {
    
    @Published var soundName: String = ""
    @Published var translatedText: String = ""
    @Published var showContent: Bool = false
    @Published var isShowing: Bool = false
    
    let isHumanToPet: Bool
    let selectedPet: TranslatorViewModel.Pet
    let onDismiss: () -> Void
    
    let phrases = [
        "I’m hungry, feed me!",
        "What are you doing, human?",
        "Give me attention now!",
        "Let’s go outside!",
        "I need a nap.",
        "This is my spot!",
        "Where have you been?",
        "Play with me!",
        "I like this food!",
        "Pet me more!",
        "I’m the boss here!",
        "Let me out!",
        "I smell something tasty!",
        "Look at me, I’m adorable!",
        "Let’s explore!",
        "I’m so happy right now!",
        "Tell me a story!",
        "Let’s cuddle!",
        "I want to run around!",
        "Listen to me!",
        "I have so much energy!",
        "Let’s have fun!",
        "Watch me do something cool!"
    ]
    
    init(isHumanToPet: Bool,
         selectedPet: TranslatorViewModel.Pet,
         onDismiss: @escaping () -> Void) {
        
        self.isHumanToPet = isHumanToPet
        self.selectedPet = selectedPet
        self.onDismiss = onDismiss
        
        if isHumanToPet {
            self.soundName = selectedPet.imageName + String(Int.random(in: 1...3))
        } else {
            translatedText = phrases.randomElement() ?? "Something went wrong! Please, try again."
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
        }
    }
    
    func onDisappear() {
        if isHumanToPet {
            SoundManager.shared.stopSound()
        }
        
        onDismiss()
    }
}
