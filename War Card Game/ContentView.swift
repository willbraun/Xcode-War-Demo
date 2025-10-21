//
//  ContentView.swift
//  War Card Game
//
//  Created by Will Braun on 10/18/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card7"
    @State var cpuCard = "card13"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        ZStack {
            Image("background-plain").resizable().ignoresSafeArea()
            
            VStack(spacing: 50) {
                Image("logo")
                
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                
                Button {
                    deal()
                } label: {
                    Image("button")
                }
                
                HStack {
                    Spacer()
                    VStack(spacing: 10) {
                        Text("Player")
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack(spacing: 10) {
                        Text("CPU")
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }.foregroundStyle(.white)
            }
        }
    }
    
    func deal() {
        // Randomize the player card
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
            
        // Randomize the CPU card
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        // Update the scores
        if playerCardValue > cpuCardValue {
            playerScore += 1
        } else if cpuCardValue > playerCardValue {
            cpuScore += 1
        }
    }
}

#Preview {
    ContentView()
}
