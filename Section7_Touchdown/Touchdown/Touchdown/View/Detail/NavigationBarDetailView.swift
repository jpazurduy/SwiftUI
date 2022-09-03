//
//  NavigationBarDetailView.swift
//  Touchdown
//
//  Created by Jorge Azurduy on 9/3/22.
//

import SwiftUI

struct NavigationBarDetailView: View {
    // MARK: - PROPERTIES
    @State private var isAnimated: Bool = false
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Button(action: {
                
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.black)
            })
            
//            Spacer()
//            
//            LogoView()
//                .opacity(isAnimated ? 1 : 0)
//                .offset(x: isAnimated ? 0 : 0, y: isAnimated ? 0 : -25)
//                .onAppear() {
//                    withAnimation(.easeOut(duration: 0.5)) {
//                        isAnimated = true
//                    }
//                }
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                ZStack {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.black)
//                    
//                    Circle()
//                        .fill(.red)
//                        .frame(width: 14, height: 14, alignment: .center)
//                        .offset(x: 13, y: -10)
                }
            })
        } // HStack
    }
}

// MARK: - PREVIEW
struct NavigationBarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
