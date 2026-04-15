//
//  GroceryListApp.swift
//  GroceryList
//
//  Created by Jorge Azurduy on 1/26/26.
//

import SwiftUI
import SwiftData

@main
struct GroceryListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Item.self)
        }
    }
}
