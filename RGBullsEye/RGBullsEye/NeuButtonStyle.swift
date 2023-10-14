
import SwiftUI

struct NeuButtonStyle: ButtonStyle {
    let width: CGFloat
    let height: CGFloat
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .opacity(configuration.isPressed ? 0.2 : 1)
            .frame(width: 327, height: 48)
            .background(
                Group {
                    if configuration.isPressed {
                        Capsule()
                            .fill(Color.element)
                    } else {
                        Capsule()
                            .fill(Color.element)
                            .northWestShadow()
                    }
                }
            )
    }
}
