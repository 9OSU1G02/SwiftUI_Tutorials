//
//  CardView.swift
//  Kuchi (iOS)
//
//  Created by 9OSU1G02 on 10/17/23.
//

import SwiftUI

struct CardView: View {
    let flashCard: FlashCard
    typealias CardDrag = (_ card: FlashCard, _ direction: DiscardedDirection) -> Void
    let dragged: CardDrag
    @State var revealed = false
    @Binding var cardColor: Color
    @State var offset: CGSize = .zero
    @GestureState var isLongPressed = false
    enum DiscardedDirection {
        case left
        case right
    }

    init(
        _ card: FlashCard,
        cardColor: Binding<Color>,
        onDrag dragged: @escaping CardDrag = { _, _ in }
    ) {
        flashCard = card
        _cardColor = cardColor
        self.dragged = dragged
    }

    var body: some View {
        let drag = DragGesture()
          .onChanged { offset = $0.translation }
          .onEnded {
            if $0.translation.width < -100 {
              offset = .init(width: -1000, height: 0)
              dragged(flashCard, .left)
            } else if $0.translation.width > 100 {
              offset = .init(width: 1000, height: 0)
              dragged(flashCard, .right)
            } else {
              offset = .zero
            }
          }
        
        let longPress = LongPressGesture()
          .updating($isLongPressed) { value, state, transition in
            state = value
          }
          .simultaneously(with: drag)
        
        return ZStack {
          Rectangle()
            .fill(cardColor)
            .frame(width: 320, height: 210)
            .cornerRadius(12)
          VStack {
            Spacer()
            Text(flashCard.card.question)
              .font(.largeTitle)
              .foregroundColor(.white)
            if revealed {
              Text(flashCard.card.answer)
                .font(.caption)
                .foregroundColor(.white)
            }
            Spacer()
          }
        }
        .shadow(radius: 8)
        .frame(width: 320, height: 210)
        .animation(.spring(), value: offset)
        .offset(offset)
        .gesture(longPress)
        .scaleEffect(isLongPressed ? 1.1 : 1)
        .animation(.easeInOut(duration: 0.3), value: isLongPressed)
        .simultaneousGesture(TapGesture()
          .onEnded {
            withAnimation(.easeIn, {
              revealed.toggle()
            })
        })
      }
}

#Preview {
    @State var cardColor = Color.red
    let card = FlashCard(
        card: Challenge(
            question: "こんにちわ",
            pronunciation: "Konnichiwa",
            answer: "Hello"
        )
    )
    return CardView(card, cardColor: $cardColor)
}
