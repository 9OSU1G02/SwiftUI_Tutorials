import SwiftUI

struct ChallengeView: View {
    let challengeTest: ChallengeTest
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.questionsPerSession) var questionPerSession
    @EnvironmentObject var challengesViewModel: ChallengesViewModel
    @State var showAnswers = false
    @Binding var numberOfAnswered: Int
    var body: some View {
      // 1
      if verticalSizeClass == .compact {
        // 2
        VStack {
          // 3
          HStack {
            Button(action: {
              showAnswers = !showAnswers
            }) {
              QuestionView(
                question: challengeTest.challenge.question)
            }
            if showAnswers {
              Divider()
              ChoicesView(challengeTest: challengeTest)
            }
          }
          ScoreView(
            numberOfQuestions: $challengesViewModel.numberOfQuestions,
            numberOfAnswered: $numberOfAnswered
          )
        }
      } else {
        // 4
        VStack {
          Button(action: {
            showAnswers = !showAnswers
          }) {
            QuestionView(
              question: challengeTest.challenge.question)
              .frame(height: 300)
          }
          ScoreView(
            numberOfQuestions: $challengesViewModel.numberOfQuestions,
            numberOfAnswered: $numberOfAnswered
          )
          if showAnswers {
            Divider()
            ChoicesView(challengeTest: challengeTest)
              .frame(height: 300)
              .padding()
          }
        }
      }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    @State static var numberOfAnswered = 0
    static let challengeTest = ChallengeTest(
        challenge: Challenge(
            question: "おねがい　します",
            pronunciation: "Onegai shimasu",
            answer: "Please"
        ),
        answers: ["Thank you", "Hello", "Goodbye"]
    )

    static var previews: some View {
        return ChallengeView(challengeTest: challengeTest, numberOfAnswered: $numberOfAnswered)
    }
}
