//
//  StartButtonView.swift
//  Fructus
//
//  Created by Jorge Azurduy on 8/22/22.
//

import SwiftUI

struct StartButtonView: View {
    // MARK: - PROPERTIES
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    // MARK: - BOODY
    var body: some View {
        Button(action: {
            isOnboarding = false
        }, label: {
            HStack(spacing: 8) {
                Text("Start")
                Image(systemName: "arrow.right.circle")
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
            .background(
                Capsule()
                    .strokeBorder(Color.white, lineWidth: 1.25)
            )
        })
        .accentColor(Color.white)
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
