//
//  SoundPlayer.swift
//  Devote
//
//  Created by Jorge Azurduy on 9/17/22.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer?.play()
        } catch {
            print("Error playn sound")
        }
    }
}
