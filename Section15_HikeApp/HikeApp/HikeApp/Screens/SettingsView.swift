//
//  SettingsView.swift
//  HikeApp
//
//  Created by Jorge Azurduy on 14/12/23.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    private let alternateAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    var body: some View {
        List {
            // MARK: - SECTION HEADER
            HStack {
                Spacer()
                Image(systemName: "laurel.leading")
                    .font(.system(size: 80, weight: .black))
                
                VStack(spacing: -10) {
                    Text("Hike")
                        .font(.system(size: 66, weight: .black))
                    
                    Text("Editors Choice")
                        .fontWeight(.medium)
                }
                
                Image(systemName: "laurel.trailing")
                    .font(.system(size: 80, weight: .black))
                
                Spacer()
            } //: HStack
            .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium, .customGreenDark],
                                            startPoint: .top, endPoint: .bottom))
            .padding(.horizontal, 8)
            
            VStack {
                Text("Where can you find perfect tracks?")
                    .font(.title2)
                    .fontWeight(.heavy)
                
                Text("Where can you find perfect tracks asfd dsf asdf dsf sdf asdf dsf dsf f sdf sdfsafdsdfsadf\n Find it. ")
                    .font(.footnote)
                    .italic()
                
                Text("Dust off the boots")
                    .font(.title3)
                    .fontWeight(.medium)
            }
            .multilineTextAlignment(.center)
            .padding(.bottom, 16)
            .frame(maxHeight: .infinity)
            
            // MARK: - SECTION ICONS
            
            Section {
                CustomLabelRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowColor: .blue)
                CustomLabelRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowColor: .red)
                CustomLabelRowView(rowLabel: "Language", rowIcon: "swift", rowContent: "Swift", rowColor: .yellow)
                CustomLabelRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowColor: .purple)
                CustomLabelRowView(rowLabel: "Developer", rowIcon: "scribble", rowContent: "Jorge Azurduy", rowColor: .green)
            } header: {
                Text("ABOUT CONTENT")
            } footer: {
                HStack {
                    Spacer()
                    Text("Copyright @ All right reserved")
                    Spacer()
                }
                .padding(.vertical, 8)
            }

            // MARK: - SECTION ABOUT
            
            Section(header: Text("Alternate Icons")) {
              ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                  ForEach(alternateAppIcons.indices, id: \.self) { item in
                    Button {
                      print("Icon \(alternateAppIcons[item]) was pressed.")
                      
                      UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                        if error != nil {
                          print("Failed request to update the app's icon: \(String(describing: error?.localizedDescription))")
                        } else {
                          print("Success! You have changed the app's icon to \(alternateAppIcons[item])")
                        }
                      }
                    } label: {
                      Image("\(alternateAppIcons[item])-Preview")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .cornerRadius(16)
                    }
                    .buttonStyle(.borderless)
                  }
                }
              } //: SCROLL VIEW
              .padding(.top, 12)
              
              Text("Choose your favourite app icon from the collection above.")
                .frame(minWidth: 0, maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .font(.footnote)
                .padding(.bottom, 12)
            } //: SECTION
            .listRowSeparator(.hidden)
            
        } //: Header
        .listRowSeparator(.hidden)
    }
}

#Preview {
    SettingsView()
}
