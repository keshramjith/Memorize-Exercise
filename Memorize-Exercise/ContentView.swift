//
//  ContentView.swift
//  Memorize-Exercise
//
//  Created by Kesh Ramjith on 2022/02/09.
//

import SwiftUI

struct ContentView: View {
    var emojisVehicles = ["✈️", "🚗", "🚕", "🚝", "🚙", "🏎", "🚜", "🚲", "🛩", "🚀"]
    var emojisFruit = ["🍒", "🍓", "🍇", "🍎", "🍉", "🍑", "🍊", "🍋", "🍍", "🍌"]
    var emojisFaces = ["🤣", "😘", "😊", "😭", "😍", "🥰", "😁", "😅", "😀", "😉"]
    @State var emojis: Array<String> = ["✈️", "🚗", "🚕", "🚝", "🚙", "🏎", "🚜", "🚲", "🛩", "🚀"]
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<10], id: \.self, content: {
                        emoji in CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            HStack {
                Button(action: { emojis = emojisVehicles.shuffled() }, label: {
                    VStack {
                        Image(systemName: "car")
                        Text("Vehicles")
                    }
                })
                Spacer()
                Button(action: { emojis = emojisFruit.shuffled() }, label: {
                    VStack {
                        Image(systemName: "heart.fill")
                        Text("Fruit")
                    }
                })
                Spacer()
                Button(action: { emojis = emojisFaces.shuffled() }, label: {
                    VStack {
                        Image(systemName: "face.smiling.fill")
                        Text("Faces")
                    }
                })
            }
        }.padding(.horizontal)
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
