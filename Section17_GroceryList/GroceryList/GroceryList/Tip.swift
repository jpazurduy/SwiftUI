//
//  Tip.swift
//  GroceryList
//
//  Created by Jorge Azurduy on 1/27/26.
//

import Foundation
import TipKit

struct ButtonTip: Tip {
    var title: Text = Text("Essential Food")
    var message: Text = Text("Add some everyday item to the shopping list")
    var image: Image = Image(systemName: "info.circle")
}
