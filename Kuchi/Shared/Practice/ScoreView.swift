//
//  ScoreView.swift
//  Kuchi
//
//  Created by 9OSU1G02 on 10/16/23.
//

import SwiftUI

struct ScoreView: View {
    @Binding var numberOfQuestions: Int
    @Binding var numberOfAnswered: Int

    var body: some View {
        HStack {
            Text("\(numberOfAnswered)/\(numberOfQuestions)")
                .font(.caption)
                .padding(4)

            Spacer()
        }
    }
}

#Preview {
    @State var numberOfQuestions = 5
    @State var numberOfAnswered: Int = 0
    return ScoreView(numberOfQuestions: $numberOfQuestions, numberOfAnswered: $numberOfAnswered)
}
