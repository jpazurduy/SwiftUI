//
//  PawsApp.swift
//  Paws
//
//  Created by Jorge Azurduy on 2/2/26.
//

import SwiftUI
import SwiftData

@main
struct PawsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Pet.self)
        }
    }
}
