//
//  AppView.swift
//  Avocados
//
//  Created by Jorge Azurduy on 11/30/22.
//

import SwiftUI

struct AppView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    // MARK: - BODY
    var body: some View {
        TabView {
            AvocadosView()
                .tabItem({
                    Image("tabicon-branch")
                    Text("Avocados")
                })
            ContentView()
                .tabItem({
                    Image("tabicon-book")
                    Text("Recipes")
                })
            RipeningStagesView()
                .tabItem({
                    Image("tabicon-avocado")
                    Text("Ripening")
                })
            SettingsView()
                .tabItem({
                    Image("tabicon-settings")
                    Text("Settings ")
                })
        }
        .edgesIgnoringSafeArea(.top)
        .accentColor(Color.primary)
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                launchScreenManager.dismiss()
            }
        }
    }
}

// MARK: - PREVIEW
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .environmentObject(LaunchScreenManager())
    }
}
