

import SwiftUI

struct MemoryView: View {
    @Binding var memory: Double
    var geometry: GeometryProxy

    var body: some View {
        #if !targetEnvironment(macCatalyst)
        let memoryClearGesture = DragGesture(minimumDistance: 20)
            .onEnded { _ in
                memory = 0.0
            }
        #else
        let memoryClearGesture = TapGesture(count: 2)
            .onEnded { _ in
                memory = 0.0
            }
        #endif
        HStack {
            Spacer()
            Text("\(memory)")
                .accessibilityIdentifier("memoryDisplay")
                .padding(.horizontal, 5)
                .frame(
                    width: geometry.size.width * 0.85,
                    alignment: .trailing
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color.gray)
                )
                .gesture(memoryClearGesture)
            Text("M")
        }.padding(.bottom).padding(.horizontal, 5)
    }
}
