//
//  CreditdsView.swift
//  Africa
//
//  Created by Jorge Azurduy on 8/31/22.
//

import SwiftUI

struct CreditdsView: View {
    // MARK: - PROPERTIES

    // MARK: - BODY
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
                 Copyright @Jorge Azurduy
                 All right reserved
                 Better Apps Less code
                """)
                .font(.footnote)
            .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

// MARK: - PREVIEW
struct CreditdsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditdsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
