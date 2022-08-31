//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Jorge Azurduy on 8/29/22.
//

import AVKit
import SwiftUI

struct VideoPlayerView: View {
    // MARK: - PROPERTIES
    var videoSelected: String
    var videoTitle: String
    
    // MARK: - BODY
    var body: some View {
        VStack {
            VideoPlayer(player: VideoPlayerHelper.playVideo(fileName: videoSelected , fileFormat: "mp4")) {
                //Text(videoTitle)
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                , alignment: .topLeading)
        } // VStack
        .accentColor(.accentColor)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - PREVIEW
struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
