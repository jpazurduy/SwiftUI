//
//  ContentView.swift
//  Avocados
//
//  Created by Jorge Azurduy on 11/30/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    var headers: [Header] = headersData
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            // MARK: - HEADER
            TabView {
                ForEach(headers) { header in
                    HeaderView(header: header)
                        
                }
            }
            .frame(maxWidth: .infinity, minHeight: 320)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
            // MARK: - DISHIES
            
            Text("Avocado Dishes")
                .fontWeight(.bold)
                .modifier(TitleModifier())
            DishesView()
                .frame(maxWidth: 640)
                .padding(.horizontal, 40)
                .padding(.vertical, 10)
            
            // MARK: - FOOTER
            VStack(alignment: .center, spacing: 20) {
                // MARK: - FOOTER
                Text("All about Avocados")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                Text("Everything you wanted to know about avocados but were tooo agraid to ask.")
                    .font(.system(.body, design: .serif))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.green)
            }
            .frame(maxWidth: 640)
            .padding()
            .padding(.bottom, 85)
        }
        .edgesIgnoringSafeArea(.top)
        .padding(0)
    }
}

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .serif))
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding(8)
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(headers: headersData)
            //.environment(\.colorScheme, .dark)
    }
}
