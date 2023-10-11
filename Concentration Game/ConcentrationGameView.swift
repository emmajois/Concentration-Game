//
//  ContentView.swift
//  Concentration Game
//
//  Created by IS 543 on 10/10/23.
//

import SwiftUI

struct ConcentrationGameView: View {
    
    let emojiGame: EmojiConcentrationGame
    
    var body: some View {
        HStack{
            ForEach(emojiGame.cards){ card in
                CardView(card: card, font: fontForGameSize())
                    .onTapGesture {
                        emojiGame.choose(card)
                    }
            }
        }
        .padding()
    }
    
    private func fontForGameSize() -> Font {
        emojiGame.cards.count < 10 ? .largeTitle : .body
    }
}

struct CardView: View {
    let card: ConcentrationGame<String>.Card
    let font: Font
    
    var body: some View{
        ZStack{
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: Card.cornerRadius).fill(.white)
                RoundedRectangle(cornerRadius: Card.cornerRadius).stroke()
                Text(card.content)
                    .font(font)
            } else{
                RoundedRectangle(cornerRadius: Card.cornerRadius)
            }
        }
        .foregroundStyle(.blue)
        .aspectRatio(Card.aspectRatio, contentMode: .fit)
    }
    
    //MARK: - Drawing constants
    private struct Card {
        static let aspectRatio: Double = 2/3
        static let cornerRadius = 10.0
    }
}

#Preview {
    ConcentrationGameView(emojiGame: EmojiConcentrationGame())
}
