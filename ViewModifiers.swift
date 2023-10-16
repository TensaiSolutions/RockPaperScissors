//
// ViewModifiers.swift
// RockPaperScissors
//
// Created by Tensai Solutions on 10/16/23
// Copyright © 2023 Tensai Solutions. All rights reserved.


import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.secondary)
    }
}

struct ConditionTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline.weight(.heavy))
            .foregroundStyle(.secondary)
    }
}

struct ConditionLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3.weight(.light))
    }
}

struct PlayerProgress: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(red: 0.30, green: 0.30, blue: 0.30))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }

    func conditionTitleStyle() -> some View {
        modifier(ConditionTitle())
    }

    func conditionLabelStyle() -> some View {
        modifier(ConditionLabel())
    }

    func playerProgressColor() -> some View {
        modifier(PlayerProgress())
    }
}

