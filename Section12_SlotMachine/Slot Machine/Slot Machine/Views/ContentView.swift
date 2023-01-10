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
    @State private var isBetTwenty: Bool = true
    @State private var showingInfoView: Bool = false
    
    let symbols = ["gfx-bell",
                   "gfx-cherry",
                   "gfx-coin",
                   "gfx-grape",
                   "gfx-seven",
                   "gfx-strawberry"]
    
    @State private var reels: [Int] = [0,1,2]
    @State private var highScore = UserDefaults.standard.integer(forKey: "HighScore")
    @State private var coins = 100
    @State private var betAmount = 10
    @State private var showingModal: Bool = false
    
    @State private var animatingSymbols: Bool = false
    @State private var animatingModal: Bool = false
    let haptics = UINotificationFeedbackGenerator()
    
    // MARK: - FUNCTIONS
    
    // SPIN THE REELS
    func spinReels() {
//        reels[0] = Int.random(in: 0...symbols.count-1)
//        reels[1] = Int.random(in: 0...symbols.count-1)
//        reels[2] = Int.random(in: 0...symbols.count-1)
        
        reels = reels.map({ _ in
            Int.random(in: 0...symbols.count-1)
        })
        
        playSound(sound: "spin", type: "mp3")
    }
    // CHECK THE WINNING
    func checkWinning() {
        if reels[0] == reels[1] && reels[1] == reels[2] && reels[0] == reels[2] {
            // PLAYER WINS
            playerWins()
            // NEW HIGH SCORE
            
            if coins > highScore {
                newHighScore()
            } else {
                playSound(sound: "win", type: "mp3")
            }
        } else {
            // PLAYER LOOES
            playerLoses()
        }
    }
    // PLAYER WINS
    
    func playerWins() {
        coins += betAmount*10
    }
    // NEW HIGHSCORE
    
    func newHighScore() {
        highScore = coins
        UserDefaults.standard.set(highScore, forKey: "HighScore")
        playSound(sound: "high-score", type: "mp3")
    }
    // PLAYER LOSES
    func playerLoses() {
        coins -= betAmount
    }
    
    func activateBet10() {
        betAmount = 10
        isBetTen = true
        isBetTwenty = false
        playSound(sound: "casino-chips", type: "mp3")
        haptics.notificationOccurred(.success)
    }
    
    func activateBet20() {
        betAmount = 20
        isBetTen = false
        isBetTwenty = true
        playSound(sound: "casino-chips", type: "mp3")
        haptics.notificationOccurred(.success)
    }
    // GAME IS OVER
    func isGameOver() {
        if coins <= 0 {
            showingModal = true
            playSound(sound: "game-over", type: "mp3")
        }
    }
    
    func resetGame() {
        UserDefaults.standard.set(0, forKey: "HighScore")
        highScore = 0
        coins = 100
        activateBet10()
    }
    
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
                        Text("\(self.coins)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    }
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack {
                        Text("\(self.highScore)")
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
                        Image(symbols[reels[0]])
                            .resizable()
                            .modifier(ImageModifier())
                            .opacity(animatingSymbols ? 1:0)
                            .offset(y: animatingSymbols ? 0: -50)
                            .onAppear() {
                                withAnimation(.easeOut(duration: Double.random(in: 0.5...0.7))) {
                                    self.animatingSymbols.toggle()
                                }
                                
                            }
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        // MARK: - REEL #2
                        ZStack {
                            RealView()
                            Image(symbols[reels[1]])
                                .resizable()
                                .modifier(ImageModifier())
                                .opacity(animatingSymbols ? 1:0)
                                .offset(y: animatingSymbols ? 0: -50)
                                .onAppear() {
                                    withAnimation(.easeOut(duration: Double.random(in: 0.5...0.7))) {
                                        self.animatingSymbols.toggle()
                                    }
                                }
                        }
                        Spacer()
                        // MARK: - REEL #3
                        ZStack {
                            RealView()
                            Image(symbols[reels[2]])
                                .resizable()
                                .modifier(ImageModifier())
                                .opacity(animatingSymbols ? 1:0)
                                .offset(y: animatingSymbols ? 0: -50)
                                .onAppear() {
                                    withAnimation(.easeOut(duration: Double.random(in: 0.5...0.7))) {
                                        self.animatingSymbols.toggle()
                                    }
                                }
                        }
                    }
                    .frame(maxWidth: 720)
                    
                    // MARK: - SPIN BUTTON
                    Button(action: {
                        // NO ANIMATION
                        withAnimation {
                            self.animatingSymbols = false
                        }
                        // SPIN
                        self.spinReels()
                        
                        // TRIGGER ANIMATION
                        withAnimation {
                            self.animatingSymbols = true
                        }
                        
                        // CHECK THE WINNING
                        self.checkWinning()
                        
                        // GAME OVER
                        self.isGameOver()
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
                        self.activateBet10()
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
                            .offset(x: isBetTen ? 0: -20)
                            .opacity(isBetTen ? 1 : 0)
                            .frame(height: 64)
                            .modifier(ShadowModifier())
                    })
                    Spacer()
                    Button(action: {
                        self.activateBet20()
                        
                    }, label: {
                        Image("gfx-casino-chips")
                            .resizable()
                            .scaledToFit()
                            .opacity(isBetTwenty ? 1 : 0)
                            .frame(height: 64)
                            .modifier(ShadowModifier())
                        Text("20")
                            .fontWeight(.heavy)
                            .foregroundColor(isBetTwenty ? .yellow : .white)
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
                    self.resetGame()
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
            .blur(radius: $showingModal.wrappedValue ? 5 : 0, opaque: false)
            
            // MARK: - POPUP
            if $showingModal.wrappedValue {
                ZStack {
                    Color("ColorTransparentBlack")
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(alignment: .center, spacing: 0) {
                        Text("Game Over")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color("AccentColor"))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 16) {
                            Image("gfx-seven-reel")
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 72)
                            
                            Text("Bad luck you lost allof the coins.")
                                .font(.system(.body, design: .rounded))
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.gray)
                                .layoutPriority(1)
                            
                            Button(action: {
                                self.showingModal = false
                                self.coins = 100
                                self.activateBet10()
                                self.animatingModal = false
                            }, label: {
                                Text("New Game".uppercased())
                                    .font(.system(.body, design: .rounded))
                                    .fontWeight(.semibold)
                                    .padding(.horizontal,12)
                                    .padding(.vertical, 8)
                                    .frame(minWidth: 128)
                                    .background(
                                        Capsule()
                                            .strokeBorder(lineWidth: 1.75)
                                            .foregroundColor(Color("AccentColor"))
                                    )
                            })
                        }
                                                
                        Spacer()
                        
                        
                    }
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320,
                           minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(color: Color("ColorTransparentBlack"), radius: 6, x: 0, y: 0)
                    .opacity($animatingModal.wrappedValue ? 1 : 0)
                    .offset(y: $animatingModal.wrappedValue ? 0 : -100)
                    .onAppear() {
                        withAnimation(.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0)) {
                            self.animatingModal = true
                        }
                    }
                }
            }
        }
        .onAppear() {
            self.activateBet10()
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
