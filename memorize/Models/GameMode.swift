//
//  GameMode.swift
//  memorize
//
//  Created by Daniel Melenge Rojas on 11/11/25.
//


import Foundation

enum GameMode: String, CaseIterable, Identifiable {
    case easy
    case medium
    case hard

    var id: String { rawValue }

    /// Nombre legible para mostrar en la interfaz
    var displayName: String {
        switch self {
        case .easy: return "Fácil"
        case .medium: return "Medio"
        case .hard: return "Difícil"
        }
    }

    /// Número de pares de cartas según la dificultad
    var numberOfPairs: Int {
        switch self {
        case .easy:
            return 6
        case .medium:
            return 10
        case .hard:
            return 14
        }
    }
}
