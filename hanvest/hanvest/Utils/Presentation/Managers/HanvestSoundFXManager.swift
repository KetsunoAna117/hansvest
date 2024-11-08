//
//  HanvestSoundFXManager.swift
//  hanvest
//
//  Created by Bryan Vernanda on 08/11/24.
//

import Foundation
import AVKit

class HanvestSoundFXManager {
    static let shared = HanvestSoundFXManager()
    
    var audioPlayer: AVAudioPlayer?
    var isPlaying: Bool {
        return audioPlayer?.isPlaying ?? false
    }
    
    func playSound(named name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            print("Sound file not found")
            return
        }
        
        do {
            if audioPlayer == nil || !isPlaying {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } else {
                print("Sound is already playing")
            }
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
}
