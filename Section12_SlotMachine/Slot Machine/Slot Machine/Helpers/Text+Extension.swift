//
//  Text+Extension.swift
//  Slot Machine
//
//  Created by Jorge Azurduy on 1/4/23.
//

import Foundation
import SwiftUI

extension Text {
    func scorLabelStyle() -> Text{
        self
            .foregroundColor(.white)
            .font(.system(size: 10, weight: .bold, design: .rounded))
    }
    
    func scoreNumberStyle() -> Text{
        self
            .foregroundColor(.white)
            .font(.system(.title, design: .rounded))
            .fontWeight(.heavy)
        
    }
    
       
}
