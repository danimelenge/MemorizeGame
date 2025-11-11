//
//  memorizeApp.swift
//  memorize
//
//  Created by Daniel Melenge Rojas on 25/02/25.
//


import SwiftUI

@main
struct memorizeApp: App {
    @StateObject private var gameViewModel = MemoryGameViewModel(theme: .animals)
    @StateObject private var themeViewModel = ThemeSelectionViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameViewModel)
                .environmentObject(themeViewModel)
        }
    }
}
