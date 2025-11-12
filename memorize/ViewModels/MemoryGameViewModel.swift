//
//  MemoryGameViewModel.swift
//  memorize
//
//  Created by Daniel Melenge Rojas on 11/11/25.
//


import SwiftUI

@MainActor
class MemoryGameViewModel: ObservableObject {
    @Published private var model: MemoryGame<String>
    @Published var currentTheme: GameTheme
    @Published var currentMode: GameMode   // ← NUEVO: modo de dificultad seleccionado

    init(theme: GameTheme, mode: GameMode = .easy) {
        self.currentTheme = theme
        self.currentMode = mode
        self.model = MemoryGameViewModel.createMemoryGame(theme: theme, mode: mode)
    }

    var cards: [MemoryGame<String>.Card] {
        model.cards
    }

    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }

    func restartGame() {
        model = MemoryGameViewModel.createMemoryGame(theme: currentTheme, mode: currentMode)
    }

    func changeTheme(to theme: GameTheme) {
        currentTheme = theme
        model = MemoryGameViewModel.createMemoryGame(theme: theme, mode: currentMode)
    }

    func changeMode(to mode: GameMode) {
        currentMode = mode
        model = MemoryGameViewModel.createMemoryGame(theme: currentTheme, mode: mode)
    }

    // MARK: - Factory
    private static func createMemoryGame(theme: GameTheme, mode: GameMode) -> MemoryGame<String> {
        let numberOfPairs = mode.numberOfPairs // se usa GameMode para definir cantidad
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairs) { pairIndex in
            theme.emojis[pairIndex % theme.emojis.count]
        }
    }
}
