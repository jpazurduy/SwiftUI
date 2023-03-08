//
//  DetailView.swift
//  Notes WatchKit Extension
//
//  Created by Jorge Azurduy on 9/20/22.
//

import SwiftUI

struct DetailView: View {
    // MARK: - PROPERTIES
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditPresented: Bool = false
    @State private var isSettingsPresented: Bool = false
    
    
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            // HEADER
            HeaderView(title: "")
            
            
            // CONTENT
            Spacer()
             
            ScrollView(.vertical, showsIndicators: false) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            // FOOTER
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresented) {
                        SettingsView()
                    }
                
                Spacer()
                Text("\(count) / \(index+1)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditPresented) {
                        CreditView()
                    }
            } // HStack
            .foregroundColor(.accentColor)
            
        } // VStack
        .padding(3)
    }
}

// MARK: - PREVIEW
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(note: Note(id: UUID(), text: "Test"), count: 5, index: 1)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
