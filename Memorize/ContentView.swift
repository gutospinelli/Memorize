//
//  ContentView.swift
//  Memorize
//
//  Created by Augusto Spinelli on 24/07/20.
//  Copyright © 2020 Augusto Spinelli. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var vmEmojiMemoryGame: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(vmEmojiMemoryGame.cards) { card in
                CardView(card: card).onTapGesture {
                    self.vmEmojiMemoryGame.choose(card: card)
                }
            } 
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
    }
}

struct CardView : View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            }
            else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
            
        }
    }
}



























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vmEmojiMemoryGame: EmojiMemoryGame())
    }
}
