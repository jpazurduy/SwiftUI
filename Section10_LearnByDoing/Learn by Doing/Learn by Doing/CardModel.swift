//
//  CardModel.swift
//  Learn by Doing
//
//  Created by Jorge Azurduy on 11/29/22.
//

import SwiftUI
import Foundation

// MARK: - CARD MODEL
struct CardModel: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
