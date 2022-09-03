//
//  SectionView.swift
//  Touchdown
//
//  Created by Jorge Azurduy on 9/2/22.
//

import SwiftUI

struct SectionView: View {
    // MARK: - PROPERTIES
    @State var rotateClockwise: Bool
    // MARK: - BODY
    var body: some View {
        VStack (spacing: 0) {
            Spacer()
            Text("Categories".uppercased())
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .rotationEffect(Angle(degrees: rotateClockwise ? 90 : -90))
            
            Spacer()
        } // VStack
        .background(colorGray.cornerRadius(12))
        .frame(width: 85)
    }
}

// MARK: - PREVIEW
struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(rotateClockwise: false)
            .previewLayout(.fixed(width: 100, height: 300))
            .padding()
            .background(colorBackground)
    }
}
