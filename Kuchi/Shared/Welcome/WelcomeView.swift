//
//  WelcomeView.swift
//  Kuchi (iOS)
//
//  Created by 9OSU1G02 on 10/14/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            WelcomeBackgroundImage()
            WelcomeMessageView()
        }
    }
}

#Preview {
    WelcomeView()
}
