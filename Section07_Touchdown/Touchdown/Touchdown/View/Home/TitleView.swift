//
//  TitleView.swift
//  Touchdown
//
//  Created by Jorge Azurduy on 9/3/22.
//

import SwiftUI

struct TitleView: View {
    // MARK: - PROPERTIES
    var title: String
    // MARK: - BODY
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Spacer()
            
        } // HStack
        .padding(.horizontal)
        .padding(.top, 15)
        .padding(.bottom, 10)
    }
}

// MARK: - PREVIEW
struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Helmet")
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
