//
//  ContentView.swift
//  Africa
//
//  Created by Jorge Azurduy on 8/24/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(width: 400, height: 300, alignment: .center)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                ForEach(animals) { animal in
                    NavigationLink(destination: {
                        AnimalDetailView(animal: animal)
                    }, label: {
                        AnimalListItemView(animal: animal)
                    })
                    
                }
                .padding(.top, 20)
            } // List
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
        } // NavigationView
        
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
