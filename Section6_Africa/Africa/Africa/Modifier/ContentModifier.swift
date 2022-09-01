//
//  ContentModifier.swift
//  Africa
//
//  Created by Jorge Azurduy on 8/31/22.
//

import Foundation
import SwiftUI

struct ContentModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            
            content
            
            Spacer()
        }
    }
}
