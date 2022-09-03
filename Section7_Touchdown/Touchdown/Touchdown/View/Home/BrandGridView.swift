//
//  BrandGridView.swift
//  Touchdown
//
//  Created by Jorge Azurduy on 9/3/22.
//

import SwiftUI

struct BrandGridView: View {
    // MARK: - PROPERTIES

    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, alignment: .center, spacing: 10, pinnedViews: []) {
                ForEach(brands) { brand in
                    BrandItemView(brand: brand)
                }
            } // LazyHGrid
            .frame(height: 200, alignment: .center)
            .padding(15)
        } // ScrollView
    }
}

// MARK: - PREVIEW
struct BrandGridView_Previews: PreviewProvider {
    static var previews: some View {
        BrandGridView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
