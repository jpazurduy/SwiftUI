//
//  SettingsView.swift
//  TodoApp
//
//  Created by Jorge Azurduy on 1/12/23.
//

import SwiftUI

/// <#Description#>
struct SettingsView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                
                // MARK: - FORM
                Form {
                    // MARK: - SECTION 3
                    Section(header: Text("Follow us on social media")) {
                      FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://swiftuimasterclass.com")
                      FormRowLinkView(icon: "link", color: Color.blue, text: "Twitter", link: "https://twitter.com/robertpetras")
                      FormRowLinkView(icon: "play.rectangle", color: Color.green, text: "Courses", link: "https://www.udemy.com/user/robert-petras")
                    } //: SECTION 3
                      .padding(.vertical, 3)
                    
                    // MARK: - SECTION 4
                    Section(content: {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "John / Jane")
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Robert Petras")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.5.0")
                    }, header: {
                        Text("About the application")
                    })
                }
                .listStyle(.grouped)
                .environment(\.horizontalSizeClass, .regular )
                
                // MARK: - FOOTER
                Text("Copyright © All rights reserved.\nBetter Apps ♡ Less Code")
                  .multilineTextAlignment(.center)
                  .font(.footnote)
                  .padding(.top, 6)
                  .padding(.bottom, 8)
                  .foregroundColor(Color.secondary)
            } // VSTACK
            .navigationBarItems(trailing:
              Button(action: {
                self.presentationMode.wrappedValue.dismiss()
              }) {
                Image(systemName: "xmark")
              }
            )
            .navigationBarTitle("Settings", displayMode: .inline)
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        } // NAVIGATION
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
