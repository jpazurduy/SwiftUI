//
//  OnboardingView.swift
//  Fructus
//
//  Created by Jorge Azurduy on 8/22/22.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    //@State private var isAnimating :Bool = false
    var fruits = FruitData.fruitsData
    
    // MARK: - BOODY
    var body: some View {
        TabView {
            ForEach(fruits[0...5]) { item in
                FruitCardView(fruit: item)
            }
        } // TABVIEW
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}
// MARK: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(fruits: FruitData.fruitsData)
    }
}
