//
//  ExternalWelinkView.swift
//  Africa
//
//  Created by Jorge Azurduy on 8/27/22.
//

import SwiftUI

struct ExternalWelinkView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    
    // MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                
                Spacer()

                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(destination: URL(string: animal.link) ?? URL(string: "http://wikipedia.org")!, label: {
                        Text(animal.name)
                    })
                }
                .foregroundColor(.accentColor)
            } // HStack
        } // GroupBox
    }
}

// MARK: - PREVIEW
struct ExternalWelinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWelinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
