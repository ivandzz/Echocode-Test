//
//  TranslatorViewModel.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import SwiftUI

final class TranslatorViewModel: ObservableObject {
    
    @Published var selectedPet: Pet = .dog
    @Published var isHumanToPet = true
    @Published var isRecording = false
    @Published var isAnimating = false
    @Published var isTranslating = false
    @Published var isShowingResult = false
    @Published var path = NavigationPath()
    
    enum Pet {
        case cat, dog
        
        var imageName: String {
            switch self {
            case .cat:
                return "cat"
            case .dog:
                return "dog"
            }
        }
    }
    
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.isTranslating = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.isTranslating = false
                self.isShowingResult = true
                self.path.append(self.selectedPet)
            }
        }

    }
}
