//
//  RecipientRatingView.swift
//  Avocados
//
//  Created by Jorge Azurduy on 12/5/22.
//

import SwiftUI

struct RecipientRatingView: View {
    // MARK: - PROPERTIES
    var recipie: Recipe
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            ForEach(1...(recipie.rating), id: \.self) { _ in
                Image(systemName: "star.fill")
                    .font(.body)
                    .foregroundColor(.yellow)
            }
        }
    }
}

// MARK: - PREVIEW
struct RecipientRatingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipientRatingView(recipie: recipesData[0])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
