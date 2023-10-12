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
    static let emojis = ["🌸","😎","🦅","🐉","🔥","🧝🏻‍♀️"]
    
    private var game = createGame()
    private var isVisible = false
    
    static func createGame() -> ConcentrationGame<String>{
        ConcentrationGame<String>(numberOfPairsOfCards: Int.random(in: 2...emojis.count)) { emojis[$0] }
    }
    //MARK: - Model Access
    var dealtCards: Array<ConcentrationGame<String>.Card> {
        isVisible ? game.cards : []
    }
    
    var score: Int {
        game.score
    }
    
    //MARK: - User Intents
    func choose(_ card: ConcentrationGame<String>.Card) {
        withAnimation(.easeIn(duration: Constants.animationDuration)){
            game.choose(card:card)
        }
    }
    
    func dealCards() {
        withAnimation(.easeInOut(duration: Constants.animationDuration)){
            isVisible = true
        }
    }
    
    func newGame() {
        withAnimation(.easeInOut(duration: Constants.animationDuration)){
            isVisible = false
            game = EmojiConcentrationGame.createGame()
        }
        dealCards()
    }
    
    //MARK: - Constants
    private struct Constants {
        static let animationDuration = 0.5
    }
}
