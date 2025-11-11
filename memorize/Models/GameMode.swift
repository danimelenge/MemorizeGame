//
//  GameMode.swift
//  memorize
//
//  Created by Daniel Melenge Rojas on 11/11/25.
//


import Foundation

enum GameMode: String, CaseIterable, Identifiable {
    case easy = "Easy"
    case normal = "Normal"
    case hard = "Hard"
    
    var id: String { self.rawValue }
    
    var pairs: Int {
        switch self {
        case .easy: return 4
        case .normal: return 8
        case .hard: return 12
        }
    }
}
