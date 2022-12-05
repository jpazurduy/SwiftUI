//
//  HeaderView.swift
//  Avocados
//
//  Created by Jorge Azurduy on 12/3/22.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES
    @State private var showHeadLine: Bool = false
    var slideAnimation: Animation {
        Animation.spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.5).speed(1).delay(0.25)
    }
    
    var header: Header
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image(header.image)
                .resizable()
                .scaledToFill()
            
            HStack(alignment: .top, spacing: 0) {
                Rectangle()
                    .fill(Color("ColorGreenLight"))
                    .frame(width: 4)
                
                VStack(alignment: .leading, spacing: 6){
                    Text(header.headline)
                        .font(.system(.title, design: .serif))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                    
                    Text(header.subheadline)
                        .font(.footnote)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                }
                .padding(.vertical, 0)
                .padding(.horizontal, 20)
                .frame(width: 281, height: 105)
                .background(Color("ColorBlackTransparentLight"))
            }
            .frame(width: 285, height: 105, alignment: .center)
            .offset(x: -66, y: showHeadLine ? 75 : 220)
            
            .onAppear() {
                withAnimation(slideAnimation) {
                    self.showHeadLine.toggle()
                }
            }
            .onDisappear() {
                withAnimation(slideAnimation) {
                    self.showHeadLine.toggle()
                }
            }
        }
        //.frame(width: 480, height: 320, alignment: .center)
    }
}

// MARK: - PREVIEW
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(header: headersData[0])
            .previewLayout(.sizeThatFits)
            //.environment(\.colorScheme, .dark)
    }
}
