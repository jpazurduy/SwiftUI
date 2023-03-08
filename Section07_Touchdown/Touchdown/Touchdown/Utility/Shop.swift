//
//  Shop.swift
//  Touchdown
//
//  Created by Jorge Azurduy on 9/4/22.
//

import Foundation


class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
