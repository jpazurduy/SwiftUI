//
//  Item.swift
//  GroceryList
//
//  Created by Jorge Azurduy on 1/26/26.
//

import Foundation
import SwiftData


@Model
class Item {
    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
