//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Augusto Spinelli on 26/07/20.
//  Copyright © 2020 Augusto Spinelli. All rights reserved.
//

import SwiftUI


//Our ViewModel
class EmojiMemoryGame : ObservableObject {
    // Private model, only acessible by ViewModel
    @Published private var game : MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    static func createMemoryGame() -> MemoryGame<String> {
        _ = ["👻","🎃","☠️","🕷"]
        let animals = ["🦙","🦛","🐈","🦘","🦜","🦧","🐘","🦮","🦥"]
        return MemoryGame<String>(numberOfPairsOfCards: animals.count) {pairIndex in
            return animals[pairIndex]
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
