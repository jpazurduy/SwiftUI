//
//  FeaturedTabView.swift
//  Touchdown
//
//  Created by Jorge Azurduy on 9/2/22.
//

import SwiftUI

struct FeaturedTabView: View {
    // MARK: - PROPERTIES

    // MARK: - BODY
    var body: some View {
        TabView {
            ForEach(players) { player in
                FeaturedItemView(player: player)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
            }
        } // TabView
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

// MARK: - PREVIEW
struct FeaturedTabView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedTabView()
        //.previewLayout(.sizeThatFits)
            .background(.gray)
    }
}
