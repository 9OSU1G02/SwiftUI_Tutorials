//
//  LearnView.swift
//  Kuchi (iOS)
//
//  Created by 9OSU1G02 on 10/17/23.
//

import SwiftUI

struct LearnView: View {
    @StateObject var learningStore = LearningStore(deck: ChallengesViewModel.challenges)
    var body: some View {
        VStack {
            Spacer()
            Text("Remembered \(learningStore.score)"
                + "/\(learningStore.deck.cards.count)")
                .font(.headline)
            DeckView(deck: learningStore.deck, onMemorized: {
                learningStore.score += 1
            })
            Spacer()
            Text("Remember 0/0")
        }
    }
}

#Preview {
    LearnView()
}
