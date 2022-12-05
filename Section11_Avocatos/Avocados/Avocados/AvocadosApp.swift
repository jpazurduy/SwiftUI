//
//  AvocadosApp.swift
//  Avocados
//
//  Created by Jorge Azurduy on 11/30/22.
//

import SwiftUI

@main
struct AvocadosApp: App {
    @StateObject var launchScreenManager = LaunchScreenManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                AppView()
                
                if launchScreenManager.state != .completed {
                    LaunchScreen()
                }
            }
            .environmentObject(launchScreenManager)
        }
    }
}
