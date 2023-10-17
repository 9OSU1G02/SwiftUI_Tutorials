//
//  FlashDeck.swift
//  Kuchi (iOS)
//
//  Created by 9OSU1G02 on 10/17/23.
//
import Combine
class FlashDeck: ObservableObject {
    @Published var cards: [FlashCard]
    init(from words: [Challenge]) {
        cards = words.map {
            FlashCard(card: $0)
        }
    }
}
