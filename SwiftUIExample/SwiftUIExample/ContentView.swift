//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by hiju on 2022/07/01.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🐁", "🐹", "🐸", "🐒", "🐰", "🐶", "🦁", "🐱", "🐨", "🐮", "🐷", "🐵", "🐤", "🦊", "🐻", "🐼", "🐔", "🐦", "🐴", "🐝", "🐛", "🦋", "🐢", "🦑"]
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer(minLength: 20)
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
