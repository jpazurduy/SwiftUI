//
//  Video.swift
//  Africa
//
//  Created by Jorge Azurduy on 8/29/22.
//

import Foundation
import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
