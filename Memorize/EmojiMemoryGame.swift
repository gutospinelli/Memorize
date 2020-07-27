//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Augusto Spinelli on 26/07/20.
//  Copyright © 2020 Augusto Spinelli. All rights reserved.
//

import SwiftUI


//Our ViewModel
class EmojiMemoryGame {
    // Private model, only acessible by ViewModel
    private var game : MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","🎃","☠️","🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) {pairIndex in
            return emojis[pairIndex]
        }
    }
        
    
    //Expose data to views in a simple fashioned way (views must be as simple as possible)
    // MARK: - Access to the Model
    var cards : Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    
    // MARK: - User Intent(s)
    func choose(card : MemoryGame<String>.Card) {
        game.choose(card: card)
    }
}
