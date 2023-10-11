//
//  EmojiConcentrationGame.swift
//  Concentration Game
//
//  Created by IS 543 on 10/10/23.
//

import SwiftUI

//we put it in the closure but I'm keeping this here for my knowledge
//func cardContent(for index: Int) -> String { return index > 0 ? "🌸" : "🦑" }

@Observable class EmojiConcentrationGame {
    //MARK: - Properties
    private var game =  ConcentrationGame<String>(numberOfPairsOfCards: 2) { index in
        index > 0 ? "🌸" : "🦑"
    }
    
    //MARK: - Model Access
    var cards: Array<ConcentrationGame<String>.Card> {
        game.cards
    }
    
    //MARK: - User Intents
    func choose(card: ConcentrationGame<String>.Card) {
        game.choose(card:card)
    }
}
