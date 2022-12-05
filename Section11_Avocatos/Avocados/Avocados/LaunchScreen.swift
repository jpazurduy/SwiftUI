//
//  LaunchScreen.swift
//  Avocados
//
//  Created by Jorge Azurduy on 11/30/22.
//

import SwiftUI
enum LaunchScreenPhase {
    case first
    case second
    case completed
}

final class LaunchScreenManager: ObservableObject {
    @Published private(set) var state: LaunchScreenPhase = .first
    func dismiss() {
        state = .second
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.state = .completed
        }
    }
}

struct LaunchScreen: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    @State private var isMoving: Bool = false
    @State private var firstPhaseIsAnimating: Bool = false
    @State private var secondPhaseIsAnimating: Bool = false
    
    private let timer = Timer.publish(every: 0.65, on: .main, in: .common).autoconnect()
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Image("avocado")
                .resizable()
                .scaledToFit()
                .frame(width: 240, height: 240)
                .scaleEffect(firstPhaseIsAnimating ?  0.6 : 1)
                .scaleEffect(secondPhaseIsAnimating ? UIScreen.main.bounds.size.height/4 : 1)
                .offset(y: isMoving ? -50 : -200)
            
            Text("AVOCADO")
                .font(Font.custom("Charter", size: 42))
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .offset(y: isMoving ? 100 : 200)
        }
        .onAppear() {
            withAnimation(.linear(duration: 1.2)) {
                isMoving.toggle()
            }
            
        }
        .onReceive(timer) { input in
            switch launchScreenManager.state {
                case .first:
                    withAnimation(.spring()) {
                        firstPhaseIsAnimating.toggle()
                    }
                case .second:
                    withAnimation(.easeInOut(duration: 1)) {
                        secondPhaseIsAnimating.toggle()
                    }
                default:
                    break
            }
            
        }
    }
}

// MARK: - PREVIEW
struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
            .environmentObject(LaunchScreenManager())
    }
}
