//
//  GameTheme.swift
//  memorize
//
//  Created by Daniel Melenge Rojas on 11/11/25.
//


import SwiftUI

struct GameTheme: Identifiable {
    var id = UUID()
    let name: String
    let emojis: [String]
    let color: Color
    let numberOfPairs: Int
    
    // MARK: - Ejemplos de temas
    static let animals = GameTheme(
        name: "Animals",
        emojis: ["🫎", "🐹", "🐔", "🐠", "🐩", "🐿️", "🦌", "🐊"],
        color: .green,
        numberOfPairs: 8
    )
    
    static let flowers = GameTheme(
        name: "Flowers",
        emojis: ["🌺", "🌹", "🌻", "🌸", "🪷", "🍁", "🌼", "🍀"],
        color: .pink,
        numberOfPairs: 8
    )
    
    static let weather = GameTheme(
        name: "Weather",
        emojis: ["☀️", "⛅️", "☃️", "☔️", "🌪️", "❄️", "🌧️", "🌩️"],
        color: .blue,
        numberOfPairs: 8
    )
    
    static let availableThemes = [animals, flowers, weather]
}
