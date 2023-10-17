//
//  FlashCard.swift
//  Kuchi (iOS)
//
//  Created by 9OSU1G02 on 10/17/23.
//

import Foundation

struct FlashCard: Identifiable {
    let id = UUID()
    var isActive = true
    var card: Challenge
}

extension FlashCard: Equatable {
    static func == (lhs: FlashCard, rhs: FlashCard) -> Bool {
        return lhs.card.question == rhs.card.question
            && lhs.card.answer == rhs.card.answer
    }
}
