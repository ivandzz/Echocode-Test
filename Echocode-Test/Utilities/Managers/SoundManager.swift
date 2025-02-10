//
//  SoundManager.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 07.02.2025.
//

import AVFAudio

final class SoundManager {
    
    static let shared = SoundManager()
    private var player: AVAudioPlayer?
    
    private init() {}
    
    func playSound(named soundName: String, completion: @escaping (Error?) -> Void) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            completion(NSError(domain: "SoundManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "Someting went wrong!"]))
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            try AVAudioSession.sharedInstance().setCategory(.playback)
            player?.prepareToPlay()
            player?.play()
            completion(nil)
        } catch {
            completion(error)
        }
    }
    
    func stopSound() {
        player?.stop()
    }
}
