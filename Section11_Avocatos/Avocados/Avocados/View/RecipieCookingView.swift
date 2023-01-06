//
//  RecipieCookingView.swift
//  Avocados
//
//  Created by Jorge Azurduy on 12/5/22.
//

import SwiftUI

struct RecipieCookingView: View {
    // MARK: - PROPERTIES
    var recipe: Recipe
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "person.2")
                Text("Serves: \(recipe.serves)")
            }
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "clock")
                Text("Prep: \(recipe.preparation)")
            }
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "flame")
                Text("Cooking: \(recipe.cooking)")
            }
        }
        .font(.footnote)
        .foregroundColor(.gray)
    }
}

// MARK: - PREVIEW
struct RecipieCookingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipieCookingView(recipe: recipesData[0])
    }
}
