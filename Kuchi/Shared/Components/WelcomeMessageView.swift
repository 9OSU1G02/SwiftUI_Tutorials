//
//  WelcomeMessageView.swift
//  Kuchi
//
//  Created by 9OSU1G02 on 10/15/23.
//

import SwiftUI

struct WelcomeMessageView: View {
    var body: some View {
        Label(
            title: {
                VStack(alignment: .leading) {
                    Text("Welcome to")
                        .font(.headline)
                        .bold()
                    Text("Kuchi")
                        .font(.largeTitle)
                        .bold()
                }
                .foregroundColor(.red)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
            },
            icon: {
                LogoImage()
            }
        )
        .labelStyle(HorizontallyAlignedLabelStyle())
    }
}

#Preview {
    WelcomeMessageView()
}
