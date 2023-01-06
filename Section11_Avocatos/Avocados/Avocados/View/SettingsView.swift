//
//  SettingsView.swift
//  Avocados
//
//  Created by Jorge Azurduy on 11/30/22.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    @State private var enableNotification :Bool = true
    @State private var backgrooundRefresh: Bool = false
    
    // MARK: - BODY
    var body: some View {
        
        VStack {
            VStack(alignment: .center, spacing: 5) {
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                    .frame(width: 100, height: 100, alignment: .center)
                .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 4)
                
                Text("Avocados".uppercased())
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenAdaptive"))
            }
            
            Form {
                // MARK: - SECTION 1
                Section(header: Text("General Settings")) {
                    Toggle(isOn: $enableNotification) {
                        Text("Enable notifications")
                    }
                    
                    Toggle(isOn: $backgrooundRefresh) {
                        Text("Background refresh")
                    }
                }
                
                // MARK: - SECTION 2
                Section(header: Text("Application")) {
                    if enableNotification {
                        HStack {
                            Text("Product")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("Avocado Recipe")
                        }
                        HStack {
                            Text("Compatibility")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("iPhone/ iPad")
                        }
                        HStack {
                            Text("Developer")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("Jorge Azurduy")
                        }
                        HStack {
                            Text("Webside")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("azurduy.com")
                        }
                        HStack {
                            Text("Version")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("1.0.0")
                        }
                    } else {
                        HStack {
                            Text("Personal message")
                                .foregroundColor(.gray)
                            
                            Spacer()
                            Text("🙃Happy Coding")
                        }
                    }
                   
                    
                }
                
            }
        }
        
        
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
