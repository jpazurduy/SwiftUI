//
//  FructusApp.swift
//  Fructus
//
//  Created by Jorge Azurduy on 8/22/22.
//

import SwiftUI

@main
struct FructusApp: App {
    // MARK: - PROPERTIES
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    // MARK: - BOODY
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
               ContentView()
            }
        }
    }
}
