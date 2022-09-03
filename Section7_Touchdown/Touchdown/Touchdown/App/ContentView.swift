//
//  ContentView.swift
//  Touchdown
//
//  Created by Jorge Azurduy on 9/1/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                NavigationBarView()
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(Color.white)
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        FeaturedTabView()
                            .padding(.vertical, 30)
                            .frame(height: 300, alignment: .center)

                        CategoryGridView()
                        
                        TitleView(title: "Helmets")
                        
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 15, pinnedViews: []) {
                            ForEach(products) { product in
                                ProductItemView(product: product)
                            }
                        } // LazyVGrid
                        .padding()
                        
                        TitleView(title: "Brands".uppercased())
                        BrandGridView()

                        
                        Spacer()
                        FooterView()
                            .padding(.horizontal)
                    } // VStack
                    
                } // ScrollView
            } // VStack
            .background(colorBackground.ignoresSafeArea(.all, edges: .all))
        } // ZStack
        .ignoresSafeArea(.all, edges: .top)
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
