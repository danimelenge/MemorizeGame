//
//  GameRulesService.swift
//  memorize
//
//  Created by Daniel Melenge Rojas on 12/11/25.
//

// GameRulesService.swift

import Foundation

struct GameRulesService {

    // MARK: - Calcular puntaje
    static func calculateScore(for matchedPairs: Int, totalPairs: Int, timeElapsed: TimeInterval) -> Int {
        let baseScore = matchedPairs * 10
        let timeBonus = max(0, Int(100 - timeElapsed / 2))
        return baseScore + timeBonus
    }

    // MARK: - Cantidad de cartas por dificultad
    static func cardsForDifficulty(_ mode: GameMode) -> Int {
        return mode.numberOfPairs
    }

    // MARK: - Validar si el juego terminó
    static func isGameComplete(matchedPairs: Int, totalPairs: Int) -> Bool {
        return matchedPairs == totalPairs
    }
}

