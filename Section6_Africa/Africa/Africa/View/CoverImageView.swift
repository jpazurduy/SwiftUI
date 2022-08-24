//
//  CoverImageView.swift
//  Africa
//
//  Created by Jorge Azurduy on 8/24/22.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - PROPERTIES
    // MARK: - BODY
    var body: some View {
        TabView {
            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                Image("cover-lion")
                    .resizable()
                .scaledToFit()
            } // ForEach
        } // TabView
        .tabViewStyle(PageTabViewStyle())
    }
}

// MARK: - PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}

// MARK: - PROPERTIES
// MARK: - BODY
