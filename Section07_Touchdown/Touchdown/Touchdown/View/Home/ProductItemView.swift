//
//  ProductItemView.swift
//  Touchdown
//
//  Created by Jorge Azurduy on 9/3/22.
//

import SwiftUI

struct ProductItemView: View {
    // MARK: - PROPERTIES
    var product: Product
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
          // PHOTO
          ZStack {
            Image(product.image)
              .resizable()
              .scaledToFit()
              .padding(10)
          } // ZStack
          .background(Color(red: product.red, green: product.green, blue: product.blue))
          .cornerRadius(12)
          
          // NAME
          Text(product.name)
            .font(.title3)
            .fontWeight(.black)
          
          // PRICE
          Text(product.formattedPrice)
            .fontWeight(.semibold)
            .foregroundColor(.gray)
        }) //: VStacks
    }
}

// MARK: - PREVIEW
struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: products[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
