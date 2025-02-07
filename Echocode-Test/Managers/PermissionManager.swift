//
//  PermissionManager.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 07.02.2025.
//

import AVFoundation

final class PermissionManager {
    static func checkMicrophonePermission(completion: @escaping (Bool) -> Void) {
        switch AVAudioApplication.shared.recordPermission {
        case .granted:
            completion(true)
        case .denied:
            completion(false)
        case .undetermined:
            AVAudioApplication.requestRecordPermission { granted in
                completion(granted)
            }
        @unknown default:
            completion(false)
        }
    }
}
