//
//  BorderedViewModifier.swift
//  Kuchi
//
//  Created by 9OSU1G02 on 10/15/23.
//

import SwiftUI

struct BorderedViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .padding(.init(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.blue)
            )
            .shadow(color: .gray.opacity(0.4), radius: 3, x: 1, y: 2)
    }
}

extension View {
    func bordered() -> some View {
        ModifiedContent(content: self, modifier: BorderedViewModifier())
    }
}
