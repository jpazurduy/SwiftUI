//
//  WishlistModel.swift
//  Whislist
//
//  Created by Jorge Azurduy on 1/26/26.
//

import Foundation
import SwiftData

@Model
class WishlistModel {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
