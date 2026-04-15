//
//  WhislistApp.swift
//  Whislist
//
//  Created by Jorge Azurduy on 1/26/26.
//

import SwiftUI
import SwiftData

@main
struct WhislistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: WishlistModel.self)
        }
    }
}
