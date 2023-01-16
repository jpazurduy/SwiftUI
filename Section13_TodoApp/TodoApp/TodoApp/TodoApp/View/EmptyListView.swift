//
//  EmptyListView.swift
//  TodoApp
//
//  Created by Jorge Azurduy on 1/11/23.
//

import SwiftUI

struct EmptyListView: View {
    // MARK: - PROPERTIES
    @State private var isAnimated: Bool = false
    // THEME
    let themes: [Theme] = themeData
    @ObservedObject var theme = ThemeSettings.shared
    
    let images: [String] = ["illustration-no1","illustration-no2","illustration-no3"]
    let tips: [String] = [
      "Use your time wisely.",
      "Slow and steady wins the race.",
      "Keep it short and sweet.",
      "Put hard tasks first.",
      "Reward yourself after work.",
      "Collect tasks ahead of time.",
      "Each night schedule for tomorrow."
    ]
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack {
                Image(images.randomElement() ?? self.images[0])
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
                    .layoutPriority(1)
                    .foregroundColor(themes[self.theme.themeSettings].themeColor)
                
                Text(tips.randomElement() ?? tips[0])
                    .layoutPriority(0.5)
                    .font(.system(.headline,design: .rounded))
                    .foregroundColor(themes[self.theme.themeSettings].themeColor)
            }
            .padding(.horizontal)
            .opacity(isAnimated ? 1:0)
            .offset(y: isAnimated ? 0 : -50)
            .onAppear {
                withAnimation(.easeOut(duration: 1.5)) {
                    self.isAnimated.toggle()
                }
            }
        } // ZSTACK
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - PREVIEW
struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
            .environment(\.colorScheme, .light)
    }
}
