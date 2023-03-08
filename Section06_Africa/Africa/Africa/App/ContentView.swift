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
    @State private var isGridViewActive: Bool = false
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible())]
    @State private var gridColum: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"
    
    
    // MARK: - FUNCTIONS
    
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: gridLayout.count % 3 + 1)
        gridColum = gridLayout.count
        print("GridColum ", gridColum)
        
        // TOOLBAR IMAGE
        
        switch(gridColum) {
            case 1:
                toolBarIcon = "square.grid.2x2"
            case 2:
                toolBarIcon = "square.grid.3x2"
            case 3:
                toolBarIcon = "rectangle.grid.1x2"
            default:
                toolBarIcon = "square.grid.2x2"
        }
    }
    // MARK: - BODY
    var body: some View {
       
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(width: 400, height: 300, alignment: .center)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(destination: {
                                AnimalDetailView(animal: animal)
                            }, label: {
                                AnimalListItemView(animal: animal)
                            }) // NavigationLink
                        } // ForEach
                        .padding(.top, 20)
                        
                        HStack(alignment: .center, spacing: 10) {
                            CreditdsView()
                                .modifier(ContentModifier())
                        }
                            
                    } // List
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: {
                                    AnimalDetailView(animal: animal)
                                }, label: {
                                    AnimalGridItemView(animal: animal)
                                }) // NavigationLink
                            } // ForEach
                        } // LazyVGrid
                        //.padding(10)
                        //.animation(.easeIn)
                    } // ScrollView
                } // If
            } // Group
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                    // LIST
                        Button(action: {
                            print("DEsactivated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        })
                    // GRID
                        Button(action: {
                            print("DEsactivated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        })
                    } // HStack
                } // ToolbarItem
            }) // toolbar
        } // NavigationView
        
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
