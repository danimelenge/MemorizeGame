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
    
    init(theme: GameTheme) {
        self.currentTheme = theme
        self.model = MemoryGameViewModel.createMemoryGame(theme: theme)
    }
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func restartGame() {
        model = MemoryGameViewModel.createMemoryGame(theme: currentTheme)
    }
    
    func changeTheme(to theme: GameTheme) {
        currentTheme = theme
        model = MemoryGameViewModel.createMemoryGame(theme: theme)
    }
    
    private static func createMemoryGame(theme: GameTheme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            theme.emojis[pairIndex]
        }
    }
}
