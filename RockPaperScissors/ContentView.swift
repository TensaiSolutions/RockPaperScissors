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
    @State private var gameChoice = Int.random(in: 0...2)
    @State private var playerShouldWin = Bool.random()
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var playerScore = 0
    @State private var showingScore = false
    @State private var numRounds = 1
    @State private var endGame = false
    var body: some View {
        VStack {
            Text("Rock Paper Scissors")
                .font(.largeTitle.bold())
                .foregroundColor(.blue)
            HStack {
                VStack{
                    Text("The Game Chose")
                    Text("\(gameMoves[gameChoice])")
                }
                VStack {
                    Text("The Player Should")
                    if(playerShouldWin) {
                        Text("Win")
                    } else {
                        Text("Lose")
                    }
                }
            }
            HStack {
                ForEach(0..<3) { moveNumber in
                    Button {
                        moveTapped(moveNumber)
                    } label: {
                        Text("\(playerMoves[moveNumber])")
                    }
                }
            }
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
