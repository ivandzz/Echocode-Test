//
//  TranslatorViewModel.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import SwiftUI

final class TranslatorViewModel: ObservableObject {
    
    //MARK: - Published properties
    @Published var selectedPet: Pet = .dog
    @Published var isHumanToPet = true
    
    @Published var isRecording = false
    @Published var isTranslating = false
    
    @Published var path = NavigationPath()
    
    //MARK: - Properties
    var isTabBarHidden: (Bool) -> Void
    
    //MARK: - Init
    init(isTabBarHidden: @escaping (Bool) -> Void) {
        self.isTabBarHidden = isTabBarHidden
    }
    
    //MARK: - Methods
    func getOverlayOpacity(for pet: Pet) -> Double {
        pet == selectedPet ? 0 : 0.5
    }
    
    func startSpeaking() {
        PermissionManager.checkMicrophonePermission { granted in
            guard granted else { return }
        }
        
        isRecording = true
    }
    
    func stopSpeaking() {
        isRecording = false
        
        // Delay for the animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.isTranslating = true
            
            // Random delay for the translation simulation
            DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 1...3)) {
                self.isTranslating = false
                self.isTabBarHidden(true)
                self.path.append(self.selectedPet)
            }
        }

    }
}
