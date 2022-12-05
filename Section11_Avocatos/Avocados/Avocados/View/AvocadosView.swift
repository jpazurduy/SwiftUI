//
//  AvocadosView.swift
//  Avocados
//
//  Created by Jorge Azurduy on 11/30/22.
//

import SwiftUI

struct AvocadosView: View {
    // MARK: - PROPERTIES
    @State private var pulseteAnimation: Bool = false
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            Image("avocado")
                .resizable()
                .scaledToFit()
                .frame(width: 240, height: 240)
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x:  0, y: 8)
                .scaleEffect(self.pulseteAnimation ? 1 : 0.9)
                .opacity(self.pulseteAnimation ? 1 : 0.9)
                //.animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: true))
            
            VStack {
                Text("Avocados")
                    .font(.system(size: 42, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                    .padding()
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 4, x: 0, y:  4)
                Text("""
                    Creamy, green, and full of nutrients!
                    Avocado is a powerhouse ingredient at any meal.Enjoy these handpicked avocado recipes
                    for breakfast, lunch, dinner & more!
                    """)
                .lineLimit(nil)
                .font(.system(.headline, design: .serif))
                .foregroundColor(Color("ColorGreenLight"))
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .frame(maxWidth: 640, minHeight: 120)
            }
            Spacer()
        }
        .background(
            Image("background")
                .resizable()
                .scaledToFill()
        )
        .edgesIgnoringSafeArea(.top)
        .onAppear() {
            withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                self.pulseteAnimation.toggle()
            }
        }
    }
}

// MARK: - PREVIEW
struct AvocadosView_Previews: PreviewProvider {
    static var previews: some View {
        AvocadosView()
            .previewDevice("iPhone 14 Pro")
            .previewDevice("iPhone 14 Pro")
            //.environment(\.colorScheme, .dark)
//        AvocadosView()
//            .environment(\.colorScheme, .dark)
    }
}
