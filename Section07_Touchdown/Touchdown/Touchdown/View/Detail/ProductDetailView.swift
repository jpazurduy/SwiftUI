//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by Jorge Azurduy on 9/3/22.
//

import SwiftUI

struct ProductDetailView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var shop: Shop
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            // NAVBAR
            NavigationBarDetailView()
                .padding(.horizontal)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            // HEADER
            HeaderDetailView()
                .padding(.horizontal)
                .padding(.vertical)
            
            // DETAIL TOP PART
            TopPartDetailView()
                .padding(.horizontal)
                .zIndex(1) // <------------------This moves the view in a Z space
            // DETAIL BOTTOM PART
            VStack(alignment: .center, spacing: 0) {
                // RATINGS + SIZES
                RatingsSizesDetailView()
                    .padding(.top, -20)
                    .padding(.bottom, 10)
                
                // DESCRIPTION
                ScrollView(.vertical, showsIndicators: false) {
                    Text(shop.selectedProduct?.description ?? sampleProduct.description)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                    
                } // ScrollView
                
                // QUANTITY + FAVOURITE
                QuantityFavouriteDetailView()
                    .padding(.vertical, 10)
                // ADD TO CART
                AddToCartDetailView()
                    .padding(.bottom, 20)
                Spacer()
            } // VStack
            .padding(.horizontal)
            .background(
                Color.white
                    .clipShape(CustomShape())
                    .padding(.top, -105)
            )
        } // VStack
        .zIndex(0)
        .ignoresSafeArea(.all, edges: .all)
        .background(Color(red: shop.selectedProduct?.red ?? sampleProduct.red,
                          green: shop.selectedProduct?.green ?? sampleProduct.green,
                          blue: shop.selectedProduct?.blue ?? sampleProduct.blue)
                    )
    }
}

// MARK: - PREVIEW
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
