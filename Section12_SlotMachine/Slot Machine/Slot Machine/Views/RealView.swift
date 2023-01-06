//
//  RealView.swift
//  Slot Machine
//
//  Created by Jorge Azurduy on 1/4/23.
//

import SwiftUI

struct RealView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        Image("gfx-reel")
            .resizable()
            .modifier(ImageModifier())
    }
}

// MARK: - PREVIEW
struct RealView_Previews: PreviewProvider {
    static var previews: some View {
        RealView()
    }
}
