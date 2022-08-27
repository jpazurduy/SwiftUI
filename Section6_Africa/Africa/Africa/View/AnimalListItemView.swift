//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Jorge Azurduy on 8/24/22.
//

import SwiftUI

struct AnimalListItemView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90, alignment: .center)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(animal.headline)
                    .font(.footnote)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            } // VStack
        } // Hstack
    }
}


// MARK: - PREVIEW
struct AnimalListItemView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalListItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
