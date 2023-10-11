//
//  ConcentrationGame.swift
//  Concentration Game
//
//  Created by IS 543 on 10/10/23.
//

import Foundation

struct ConcentrationGame<CardContent> {
    var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        
        cards.shuffle()
    }
    
    mutating func choose(card: Card){
        print("You chose \(card)")
        
        if let index = cards.firstIndex(matching: card) {
            cards[index].isFaceUp.toggle()
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}
