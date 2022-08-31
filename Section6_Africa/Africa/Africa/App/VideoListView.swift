//
//  VideoListView.swift
//  Africa
//
//  Created by Jorge Azurduy on 8/24/22.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - PROPERTIES
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImapact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(videos.shuffled()) { item in
                    NavigationLink(destination: {
                        VideoPlayerView(videoSelected: item.id, videoTitle: item.name)
                    }, label: {
                        VideoListItemView(video: item)
                            .padding(.vertical, 18)
                    })
                }
            } // List
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                        hapticImapact.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            }
        } // NavigatioonView
        
    }
}

// MARK: - PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
