//
//  GradientButtonStyle.swift
//  HikeApp
//
//  Created by Jorge Azurduy on 7/12/23.
//

import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(configuration.isPressed ?
                // A: When User pressed the button
                LinearGradient(colors: [.customGrayMedium, .customGrayLight],
                                             startPoint: .top,
                                             endPoint: .bottom)
                :
                // B: When the button is not pressed
                LinearGradient(colors: [.customGrayLight, .customGrayMedium],
                                                         startPoint: .top,
                                                         endPoint: .bottom))
            .cornerRadius(40)
    }
}
