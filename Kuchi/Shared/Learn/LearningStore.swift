//
//  LearningStore.swift
//  Kuchi (iOS)
//
//  Created by 9OSU1G02 on 10/17/23.
//

import Combine
class LearningStore: ObservableObject {
  // 1
  @Published var deck: FlashDeck

  // 2
  @Published var card: FlashCard?

  // 3
  @Published var score = 0

  // 4
  init(deck: [Challenge]) {
    self.deck = FlashDeck(from: deck)
    self.card = getNextCard()
  }

  // 5
  func getNextCard() -> FlashCard? {
    guard let card = deck.cards.last else {
      return nil
    }

    self.card = card
    deck.cards.removeLast()

    return self.card
  }
}
