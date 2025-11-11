//
//  MemoryGame.swift
//  memorize
//
//  Created by Daniel Melenge Rojas on 11/11/25.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]
    
    // MARK: - Función para elegir carta
    mutating func choose(_ card: Card) {
        if let chosenIndex = index(of: card),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    private func index(of card: Card) -> Int? {
        cards.firstIndex(where: { $0.id == card.id })
    }
    
    // MARK: - Inicializador
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            let firstCard = Card(content: content, id: pairIndex * 2)
            let secondCard = Card(content: content, id: pairIndex * 2 + 1)
            cards += [firstCard, secondCard]
        }
        cards.shuffle()
    }
    
    // MARK: - Estructura interna Card
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}

