//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Augusto Spinelli on 24/07/20.
//  Copyright © 2020 Augusto Spinelli. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var vmEmojiMemoryGame: EmojiMemoryGame
    
    var body: some View {
        Grid(vmEmojiMemoryGame.cards) { card in
            CardView(card: card).onTapGesture {
                self.vmEmojiMemoryGame.choose(card: card)
            }
            .padding(self.cardPadding)
        }
        .padding()
        .foregroundColor(Color.orange)
    }
    
    //MARK: Drawing Constants
    let cardPadding : CGFloat = 5
}

struct CardView : View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size : CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(self.card.content)
            }
            else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
                
            }
            
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    //MARK: Drawing Constants
    let cornerRadius : CGFloat = 10.0
    let edgeLineWidth : CGFloat = 3
    func fontSize(for size : CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
    
}



























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(vmEmojiMemoryGame: EmojiMemoryGame())
    }
}
