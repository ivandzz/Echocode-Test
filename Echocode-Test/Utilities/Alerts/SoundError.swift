//
//  SoundError.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 09.02.2025.
//

import Foundation

enum SoundError: LocalizedError {
    case playbackFailed(Error)
    
    var errorDescription: String? {
        switch self {
        case .playbackFailed(let error):
            return error.localizedDescription
        }
    }
}
