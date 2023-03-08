//
//  Fruit.swift
//  Fructus
//
//  Created by Jorge Azurduy on 8/22/22.
//

import SwiftUI
import Foundation

struct Fruit: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
