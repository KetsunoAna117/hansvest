//
//  HanvestSoundFXManager.swift
//  hanvest
//
//  Created by Bryan Vernanda on 08/11/24.
//

import Foundation
import AVKit

class HanvestSoundFXManager {
    private static var audioPlayer: AVAudioPlayer?
    
    static func playSound(named name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            print("Sound file not found")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
}
