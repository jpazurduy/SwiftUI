//
//  ContentView.swift
//  Fructus
//
//  Created by Jorge Azurduy on 8/22/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    var fruits: [Fruit] = FruitData.fruitsData
    
    @State private var isShowingState :Bool = false
    
    // MARK: - BOODY
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(destination: FruitDetailView(fruit: item)) {
                        FruitRowView(fruit: item)
                            .padding(.vertical, 4)
                    }
                    
                }
            }
            .navigationTitle("Fuits")
            .navigationBarItems(trailing: Button(action: {
                isShowingState = true
            }, label: {
                Image(systemName: "slider.horizontal.3")
            }))
            .sheet(isPresented: $isShowingState) {
                SettingsView()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: FruitData.fruitsData)
            
    }
}
