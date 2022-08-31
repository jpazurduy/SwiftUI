//
//  GalleryView.swift
//  Africa
//
//  Created by Jorge Azurduy on 8/24/22.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    // SIMPLE GRID DEFINITION
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
    // EFFICIENT GRID DEFINITION
//     let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // DYNAMIC GRID LAYOUT
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColum: Double = 3
    
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridColum))
    }
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                // MARK: - IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white, lineWidth: 8))
                
                // MARK: - SLIDER
                
                Slider(value: $gridColum, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColum, perform: { value in
                        gridSwitch()
                    })
                
                // MARK: - GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    } // ForEach
                } // LazyVGrid
                .animation(.easeIn)
                .onAppear() {
                    gridSwitch()
                }
            } // VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        } //: ScrollView
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

// MARK: - PREVIEW
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
