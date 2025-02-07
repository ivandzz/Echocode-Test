//
//  TranslatorViewModel.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import Foundation

final class TranslatorViewModel: ObservableObject {
    
    @Published var selectedPet: Pet = .dog
    @Published var isHumanToPet = true
    @Published var isRecording = false
    @Published var isAnimating = false
    
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
    }
}
