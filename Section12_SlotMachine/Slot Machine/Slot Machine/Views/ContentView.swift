//
//  ContentView.swift
//  Slot Machine
//
//  Created by Jorge Azurduy on 1/4/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var isBetTen: Bool = true
    @State private var showingInfoView: Bool = false
    // MARK: - BODY
    var body: some View {
        ZStack {
            // MARK: - BACKGROUND
            LinearGradient(gradient: Gradient(colors: [Color("AccentColor"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            // MARK: - INTERFACE
            VStack(alignment: .center, spacing: 5) {
                // MARK: - HEADER
                LogoView()
                    .padding(.top, 20)
                Spacer()
                
                // MARK: - SCORE
                HStack {
                    HStack {
                        Text("Your\nCouns".uppercased())
                            .scorLabelStyle()
                            .multilineTextAlignment(.trailing)
                        Text("100")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    }
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack {
                        Text("200")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        Text("High\nScore".uppercased())
                            .scorLabelStyle()
                            .multilineTextAlignment(.leading)
                    }
                    .modifier(ScoreContainerModifier())
                }
                
                Spacer()
                // MARK: - SLOT MACHINE
                VStack(alignment: .center, spacing: 0) {
                    // MARK: - REEL #1
                    ZStack {
                        RealView()
                        Image("gfx-bell")
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        // MARK: - REEL #2
                        ZStack {
                            RealView()
                            Image("gfx-seven")
                                .resizable()
                                .modifier(ImageModifier())
                        }
                        Spacer()
                        // MARK: - REEL #3
                        ZStack {
                            RealView()
                            Image("gfx-cherry")
                                .resizable()
                                .modifier(ImageModifier())
                        }
                    }
                    .frame(maxWidth: 720)
                    
                    // MARK: - SPIN BUTTON
                    Button(action: {
                        print("Spin")
                    }, label: {
                        Image("gfx-spin")
                            .resizable()
                            .modifier(ImageModifier())
                    })
                }
                .layoutPriority(2)
                
                
                // MARK: - FOOTER
                Spacer()
                HStack {
                    Button(action: {
                        print("Bet 10")
                            isBetTen = true
                    }, label: {
                        Text("10")
                            .fontWeight(.heavy)
                            .foregroundColor(isBetTen ? .yellow : .white)
                            .font(.system(.title, design: .rounded))
                            .padding(.vertical, 5)
                            .frame(width: 90)
                            .shadow(color: Color("ColorTransparenctBlack"), radius: 0, x: 0, y: 3)
                            .modifier(BetCapsuleModifier())
                        Image("gfx-casino-chips")
                            .resizable()
                            .scaledToFit()
                            .opacity(isBetTen ? 1 : 0)
                            .frame(height: 64)
                            .modifier(ShadowModifier())
                        
                    })
                    Spacer()
                    Button(action: {
                        isBetTen = false
                    }, label: {
                        Image("gfx-casino-chips")
                            .resizable()
                            .scaledToFit()
                            .opacity(isBetTen ? 0 : 1)
                            .frame(height: 64)
                            .modifier(ShadowModifier())
                        Text("20")
                            .fontWeight(.heavy)
                            .foregroundColor(isBetTen ? .white : .yellow)
                            .font(.system(.title, design: .rounded))
                            .padding(.vertical, 5)
                            .frame(width: 90)
                            .shadow(color: Color("ColorTransparenctBlack"), radius: 0, x: 0, y: 3)
                            .modifier(BetCapsuleModifier())
                        
                        
                    })
                }
                
                
            }
            // MARK: - BUTTONS
            .overlay(
                // RESET
                Button(action: {
                    print("reset the game")
                }, label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                        .modifier(ButtonModifier())
                })
                , alignment: .topLeading)
            .overlay(
                // INFORMATION
                Button(action: {
                    self.showingInfoView = true
                }, label: {
                    Image(systemName: "info.circle")
                        .modifier(ButtonModifier())
                })
                , alignment: .topTrailing)
            .padding()
            .frame(maxWidth: 720)
        }
        .sheet(isPresented: $showingInfoView) {
            InfoView()
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
