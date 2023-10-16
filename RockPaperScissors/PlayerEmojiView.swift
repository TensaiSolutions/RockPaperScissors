//
// PlayerEmojiView.swift
// RockPaperScissors
//
// Created by Tensai Solutions on 10/16/23
// Copyright © 2023 Tensai Solutions. All rights reserved.


import SwiftUI

struct PlayerEmojiView: View {
    var emoji: String
    var caption: String

    var body: some View {
        VStack {
            Text(emoji)
                .font(.system(size: 65))
                .padding(10)
                .overlay(
                    Circle()
                        .stroke(Color(red: 0.1, green: 0.59, blue: 0.55), lineWidth: 1)
                )
            Text(caption)
                .font(.title3)
                .foregroundColor(Color(red: 0.1, green: 0.49, blue: 0.55))
        }
    }
}

#Preview {
    PlayerEmojiView(emoji: "👊", caption: "Rock")
}
