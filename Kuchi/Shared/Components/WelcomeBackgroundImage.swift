//
//  WelcomeBackgroundImage.swift
//  Kuchi
//
//  Created by 9OSU1G02 on 10/15/23.
//

import SwiftUI

struct WelcomeBackgroundImage: View {
    var body: some View {
        GeometryReader { geometry in
            Image("welcome-background")
                .resizable()
                .aspectRatio(1 / 1, contentMode: .fill)
                .frame(width: geometry.size.width, alignment: .center)
                .edgesIgnoringSafeArea(.all)
                .saturation(0.5)
                .blur(radius: 5)
                .opacity(0.08)
        }
    }
}

#Preview {
    WelcomeBackgroundImage()
}
