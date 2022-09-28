//
//  SwiftUIView.swift
//  Notes WatchKit Extension
//
//  Created by Jorge Azurduy on 9/27/22.
//

import SwiftUI

struct CreditView: View {
    // MARK: - PROPERTIES
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 3) {
            // MARK: - PROFILE NAME
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            // MARK: - HEADER
            HeaderView(title: "Credits")
            
            // MARK: - CONTENT
            Text("Jorge Azurduy")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.primary)
                .fontWeight(.light)
        } // VStack
    }
}

// MARK: - PREVIEW
struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
