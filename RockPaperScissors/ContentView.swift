//
// ContentView.swift
// RockPaperScissors
//
// Created by Tensai Solutions on 10/16/23
// Copyright © 2023 Tensai Solutions. All rights reserved.


import SwiftUI

struct ContentView: View {
    @State private var gameMoves = ["👊", "👋", "✌️"]
    @State private var playerMoves = ["👋", "✌️", "👊"]
    @State private var playerMoveCaptions = ["Paper", "Scissors", "Rock"]
    @State private var gameChoice = Int.random(in: 0...2)
    @State private var playerShouldWin = Bool.random()
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var playerScore = 0
    @State private var showingScore = false
    @State private var numRounds = 1
    @State private var endGame = false
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.4, green: 0.7, blue: 0.65, opacity: 0.9), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.45, blue: 0.26, opacity: 0.5), location: 1)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            VStack {
                Spacer()

                Text("Rock Paper Scissors")
                    .titleStyle()

                Spacer()

                VStack {
                    VStack(spacing: 15) {
                        Text("Select your move")
                            .conditionTitleStyle()

                        HStack {
                            Spacer()

                            VStack {
                                Text("Game Move:")
                                    .conditionLabelStyle()
                                Text(gameMoves[gameChoice])
                                    .font(.largeTitle)
                            }
                            Spacer()

                            VStack {
                                Text("Win or Lose:")
                                    .conditionLabelStyle()
                                if playerShouldWin {
                                    Text("Win")
                                        .font(.largeTitle.weight(.semibold))
                                        .foregroundColor(Color(red: 0.1, green: 0.69, blue: 0.55))
                                } else {
                                    Text("Lose")
                                        .font(.largeTitle.weight(.semibold))
                                        .foregroundColor(Color(red: 0.69, green: 0.1, blue: 0.25))
                                }
                            }

                            Spacer()
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))

                HStack {
                    ForEach(0..<3) { moveNumber in
                        Button {
                            moveTapped(moveNumber)
                        } label: {
                            PlayerEmojiView(emoji: playerMoves[moveNumber], caption: playerMoveCaptions[moveNumber])
                        }
                    }
                }
                .padding(.vertical, 50)

                Spacer()

                Text("Round \(numRounds) of 5")
                    .font(.headline)

                Spacer()

                Text("Score: \(playerScore)")
                    .font(.title.bold())

                Spacer()

            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: nextRound)
        } message: {
            Text("\(scoreMessage)\n Your current Score is \(playerScore) points.")
        }
        .alert(scoreTitle, isPresented: $endGame) {
            Button("Reset", action: reset)
        } message: {
            Text("Your score was \(playerScore) points.")
        }
    }

    func moveTapped( _ number: Int) {
        if (number == gameChoice && playerShouldWin) || (number != gameChoice && !playerShouldWin) {
            scoreTitle = "Correct"
            scoreMessage = "You gained +5 points to your score!"
            playerScore += 5
        } else {
            scoreTitle = "Wrong"
            scoreMessage = "You lost -5 points from your score."
            if playerScore >= 5 {
                playerScore -= 5
            } else {
                playerScore = 0
            }
        }
        showingScore = true

        if numRounds == 5 {
            endGame = true
            scoreTitle = "Your Results"
        }
    }

    func nextRound() {
        if numRounds < 5 {
            numRounds += 1
            gameChoice = Int.random(in: 0..<3)
            playerShouldWin.toggle()
        }
    }

    func reset() {
        numRounds = 1
        playerScore = 0
        playerShouldWin = Bool.random()
        gameChoice = Int.random(in: 0...2)
        showingScore = false
    }
}

#Preview {
    ContentView()
}
