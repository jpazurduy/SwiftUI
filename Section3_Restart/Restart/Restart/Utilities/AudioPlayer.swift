//
//  AudioPlayer.swift
//  Restart
//
//  Created by Jorge Azurduy on 8/16/22.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?


struct AudioPlayer {
    static func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("Error")
            }
        }
    }
}
