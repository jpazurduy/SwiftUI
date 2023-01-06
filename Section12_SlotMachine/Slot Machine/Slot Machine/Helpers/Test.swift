//
//  Test.swift
//  Slot Machine
//
//  Created by Jorge Azurduy on 1/4/23.
//

import Foundation
import SwiftUI

struct Test: View {
    
    @State private var isLoading = true
    
    var body: some View {
        Text("Swift by Sundell")
                   .font(.title)
                   .padding(35)
                   .background(
                       LinearGradient(
                           colors: [.orange, .red],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing
                       )
                   )
                   .overlay(alignment: .topTrailing) {
           Image(systemName: "star")
               .padding([.top, .trailing], 5)
       }
       .overlay {
           if isLoading {
               ZStack {
                   Color(white: 0, opacity: 0.75)
                   ProgressView().tint(.white)
               }
           }
       }
                   .foregroundColor(.white)
                   .cornerRadius(20)
    }
}


// MARK: - PREVIEW
struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
