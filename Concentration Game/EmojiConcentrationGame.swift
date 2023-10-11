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
    static let emojis = ["🌸","🦑","😎","🦅", "🪼","🐙","🐉","🔥","🧝🏻‍♀️"]
    
    private var game = createGame()
    
    static func createGame() -> ConcentrationGame<String>{
        ConcentrationGame<String>(numberOfPairsOfCards: Int.random(in: 2...emojis.count)) { emojis[$0] }
    }
    //MARK: - Model Access
    var cards: Array<ConcentrationGame<String>.Card> {
        game.cards
    }
    
    //MARK: - User Intents
    func choose(_ card: ConcentrationGame<String>.Card) {
        game.choose(card:card)
    }
}
