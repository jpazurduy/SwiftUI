//
//  Note.swift
//  Notes WatchKit Extension
//
//  Created by Jorge Azurduy on 9/20/22.
//

import Foundation

struct Note: Codable, Identifiable {
    var id: UUID
    var text :String
}
