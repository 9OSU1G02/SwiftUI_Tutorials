//
//  WelcomeView.swift
//  Kuchi (iOS)
//
//  Created by 9OSU1G02 on 10/14/23.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var challengesViewModel: ChallengesViewModel
    @State var showPractice = false
    var body: some View {
        if showPractice {
            PracticeView(challengeTest: $challengesViewModel.currentChallenge, userName: $userManager.profile.name, numberOfAnswered: .constant(challengesViewModel.numberOfAnswered))
                .environment(\.questionPerSession, challengesViewModel.numberOfQuestions)
        } else {
            ZStack {
                WelcomeBackgroundImage()
                VStack {
                    Text(verbatim: "Hi, \(userManager.profile.name)")
                    WelcomeMessageView()
                    Button(action: {
                        self.showPractice = true
                    }, label: {
                        HStack {
                            Image(systemName: "play")
                            Text(verbatim: "Start")
                        }
                    })
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
        .environmentObject(UserManager())
}
