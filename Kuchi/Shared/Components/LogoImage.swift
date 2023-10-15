//
//  LogoImage.swift
//  Kuchi
//
//  Created by 9OSU1G02 on 10/15/23.
//

import SwiftUI

struct LogoImage: View {
    var body: some View {
        Image(systemName: "table")
        .resizable()
        .frame(width: 30, height: 30)
        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
        .background(Color(white: 0.9))
        .clipShape(Circle())
        .foregroundColor(.red)
    }
}

#Preview {
    LogoImage()
}
