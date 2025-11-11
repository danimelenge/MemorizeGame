//
//  Card.swift
//  memorize
//
//  Created by Daniel Melenge Rojas on 11/11/25.
//

import Foundation

struct Card<Content>: Identifiable where Content: Equatable {
    var id = UUID()
    var isFaceUp = false
    var isMatched = false
    var content: Content
}
