

import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var guess: RGB
    @State var showScore = false
    var body: some View {
        VStack {
            ColorCircle(rgb: game.target)
            if !showScore {
                Text("R: ??? G: ??? B: ???")
                    .padding()
            } else {
                Text(guess.intString())
                    .padding()
            }
            ColorCircle(rgb: guess)
            Text(guess.intString())
                .padding()
            ColorSlider(value: $guess.red, trackColor: .red)
            ColorSlider(value: $guess.green, trackColor: .green)
            ColorSlider(value: $guess.blue, trackColor: .blue)
            Button(action: {
                showScore = true
                game.check(guess: guess)
            }, label: {
                Text("Hit Me!")
            })
            .alert(isPresented: $showScore, content: {
                Alert(title: Text("Your score"), message: Text(String(game.scoreRound)), dismissButton: .default(.init("Ok")) {
                    game.startNewRound()
                    guess = .init()
                })
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(guess: .init())
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var trackColor: Color
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value)
                .accentColor(trackColor)
            Text("255")
        }
        .padding(.horizontal)
    }
}

struct ColorCircle: View {
    let rgb: RGB
    var body: some View {
        Circle()
            .fill(Color(rgbStruct: rgb))
    }
}
