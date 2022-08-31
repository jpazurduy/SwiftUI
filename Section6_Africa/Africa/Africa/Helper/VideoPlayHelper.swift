//
//  VideoPlayHelper.swift
//  Africa
//
//  Created by Jorge Azurduy on 8/29/22.
//

import AVKit
import Foundation

struct VideoPlayerHelper {
    private static var videoPlayer: AVPlayer?
    
    static func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
        if let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
            videoPlayer = AVPlayer(url: url)
            videoPlayer?.play()
        }
        return videoPlayer!
    }
}

