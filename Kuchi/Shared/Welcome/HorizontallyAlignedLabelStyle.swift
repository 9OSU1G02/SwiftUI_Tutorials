//
//  HorizontallyAlignedLabelStyle.swift
//  Kuchi (iOS)
//
//  Created by 9OSU1G02 on 10/14/23.
//

import SwiftUI

struct HorizontallyAlignedLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
            configuration.title
        }
    }
}

