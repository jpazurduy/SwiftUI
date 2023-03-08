//
//  ChildButton.swift
//  Devote
//
//  Created by Jorge Azurduy on 9/6/22.
//

import SwiftUI

struct ChildButton: View {
    // MARK: - PROPERTIES
    @Binding var counter: Int
    
    // MARK: - BODY
    var body: some View {
        Button(action: {
            counter+=1
        }, label: {
            
            Text("Increment")
                .font(.title)
                .fontWeight(.black)
        })
    }
}

// MARK: - PREVIEW
struct ChildButton_Previews: PreviewProvider {
    static var previews: some View {
        ChildButton(counter: .constant(0))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
