//
//  FloatingButtonView.swift
//  TodoApp
//
//  Created by Jorge Azurduy on 1/13/23.
//

import SwiftUI

struct FloatingButtonView: View {
    // MARK: - PROPERTIES
    @State private var animatingButton: Bool = false
    @Binding var showAddTodoView: Bool
    // THEME
    let themes: [Theme] = themeData
    @ObservedObject var theme = ThemeSettings.shared
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Group {
                Circle()
                    .fill(themes[self.theme.themeSettings].themeColor)
                    .opacity(self.animatingButton ? 0.2 : 0)
                    .scaleEffect(self.animatingButton ? 1 : 0)
                    .frame(width: 68, height: 68, alignment: .center)
                Circle()
                    .fill(themes[self.theme.themeSettings].themeColor)
                    .opacity(self.animatingButton ?  0.15 : 0)
                    .scaleEffect(self.animatingButton ? 1 : 0)
                    .frame(width: 88, height: 88, alignment: .center)
            }

            Button(action: {
                self.showAddTodoView.toggle()
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .background(
                        Circle()
                            .fill(Color("ColorBase")))
                    .frame(width: 48, height: 48, alignment: .center)
            })
            
        } //  ZSTACK
        .padding(.bottom, 15)
        .padding(.trailing, 15)
        .accentColor(themes[self.theme.themeSettings].themeColor)
        .onAppear() {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: true)) {
                self.animatingButton.toggle()
            }
        }
    }
}

// MARK: - PREVIEW
struct FloatingButtonView_Previews: PreviewProvider {
    @State static var showAddTodoView = false
    static var previews: some View {
        FloatingButtonView(showAddTodoView: $showAddTodoView)
    }
}
