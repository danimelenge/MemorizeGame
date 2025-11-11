//
//  ThemeSelectionViewModel.swift
//  memorize
//
//  Created by Daniel Melenge Rojas on 11/11/25.
//

import SwiftUI

@MainActor
class ThemeSelectionViewModel: ObservableObject {
    @Published var themes: [GameTheme] = GameTheme.availableThemes
    @Published var selectedTheme: GameTheme? = GameTheme.animals
    
    func selectTheme(_ theme: GameTheme) {
        selectedTheme = theme
    }
    
    func randomTheme() {
        selectedTheme = themes.randomElement()
    }
}
