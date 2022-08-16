//
//  HomeView.swift
//  Restart
//
//  Created by Jorge Azurduy on 8/3/22.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardingActive: Bool = false
    @State private var isAnimating = false
    // MARK: - BODY
    var body: some View {
        VStack {
            // MARK: - HEADER
            Spacer()
            ZStack {
                CircleGroupView(shapeColor: .gray, shapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35: -35)
                    .animation(
                        Animation
                            .easeOut(duration: 4).repeatForever(), value: isAnimating)
            }
       
            // MARK: - CENTER
         
            Text("The time that leads tl mastery is depende on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            
            // MARK: - FOOTER
            
            Spacer()
            
            Button(action: {
                withAnimation(Animation.easeInOut(duration: 1), {
                    AudioPlayer.playSound(sound: "success", type: "m4a")
                    isOnboardingActive = true
                })
            }, label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            })
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
                
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
