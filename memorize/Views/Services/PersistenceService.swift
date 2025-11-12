//
//  PersistenceService.swift
//  memorize
//
//  Created by Daniel Melenge Rojas on 12/11/25.
//


import Foundation

final class PersistenceService {
    static let shared = PersistenceService()
    private let defaults = UserDefaults.standard

    private init() {}

    // MARK: - Save Game Data
    func saveHighScore(_ score: Int, forTheme theme: String) {
        defaults.set(score, forKey: "highScore_\(theme)")
    }

    func getHighScore(forTheme theme: String) -> Int {
        defaults.integer(forKey: "highScore_\(theme)")
    }

    func saveLastTheme(_ themeName: String) {
        defaults.set(themeName, forKey: "lastTheme")
    }

    func getLastTheme() -> String? {
        defaults.string(forKey: "lastTheme")
    }

    func clearAllData() {
        if let bundleID = Bundle.main.bundleIdentifier {
            defaults.removePersistentDomain(forName: bundleID)
        }
    }
}
