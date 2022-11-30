//
//  PlaySound.swift
//  Learn by Doing
//
//  Created by Jorge Azurduy on 11/29/22.
//


import Foundation
import AVFoundation

struct PlaySound {
    static var audioPlayer: AVAudioPlayer?
    
    static func playSount(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("Error playing sound.")
            }
        }
    }
}
