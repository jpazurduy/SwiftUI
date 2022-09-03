//
//  Constants.swift
//  Touchdown
//
//  Created by Jorge Azurduy on 9/1/22.
//

import Foundation
import SwiftUI

// DATA
let players: [Player] = Bundle.main.decode("player.json")
let categories: [Category] = Bundle.main.decode("category.json")

// COLOR
let colorBackground: Color = Color("ColorBackground")
let colorGray: Color = Color(UIColor.systemGray4)
// LAYOUT

let columSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 3)
}
// UX

// API
// IMAGE
// FONT
// STRING
// MISC
