//
//  Infoview.swift
//  Slot Machine
//
//  Created by Jorge Azurduy on 1/4/23.
//

import SwiftUI

struct InfoView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            LogoView()
                .padding(.top, 40)
            
            Spacer()
            
            Form {
                Section(content: {
                    FormRowView(firstItem: "Application", secondItem: "Slot Machine")
                    FormRowView(firstItem: "Platforms", secondItem: "iPhone / iPad / Mac")
                    FormRowView(firstItem: "Developer", secondItem: "Jorge Azurduy")
                    FormRowView(firstItem: "Designer", secondItem: "Udemy")
                    FormRowView(firstItem: "Music", secondItem: "Udemy")
                    FormRowView(firstItem: "Website", secondItem: "Slot Machine")
                    FormRowView(firstItem: "Version", secondItem: "1.0.0")
                }, header: {
                    Text("About the application")
                        .padding(.leading, -10)
                })
            }
            .padding(.top, 40)
            .padding(.horizontal, 0)
        }
        .overlay(
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                audioPlayer?.stop()
            }, label: {
                Image(systemName: "xmark.circle")
                    .font(.title)
                
            })
            .padding(.top, 30)
            .padding(.trailing, 20)
            .accentColor(Color.secondary)
            , alignment: .topTrailing)
        .onAppear() {
            playSound(sound: "background-music", type: "mp3")
        }
    }
}

struct FormRowView: View {
    var firstItem: String
    var secondItem: String
    var body: some View {
        HStack {
            Text(firstItem)
                .foregroundColor(.gray)
            Spacer()
            Text(secondItem)
        }
        .padding(0)
    }
}

// MARK: - PREVIEW
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
