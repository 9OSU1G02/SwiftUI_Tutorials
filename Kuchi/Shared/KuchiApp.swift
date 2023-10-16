

import SwiftUI

@main
struct KuchiApp: App {
    let userManager = UserManager()
    let challengesViewModel = ChallengesViewModel()
    init() {
        userManager.load()
    }
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManager)
                .environmentObject(challengesViewModel)
        }
    }
}

struct KuchiApp_Previews: PreviewProvider {
    static let user = UserManager(name: "Huy")
    static var previews: some View {
        return StarterView()
            .environmentObject(user)
    }
}
