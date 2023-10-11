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
                CardView(card: card)
            }
        }
        .padding()
    }
}

struct CardView: View {
    let card: ConcentrationGame<String>.Card
    
    var body: some View{
        ZStack{
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: 10).fill(.white)
                RoundedRectangle(cornerRadius: 10).stroke()
                Text(card.content)
                    .font(.largeTitle)
            } else{
                RoundedRectangle(cornerRadius: 10)
            }
        }
        .foregroundStyle(.blue)
    }
}

#Preview {
    ConcentrationGameView(emojiGame: EmojiConcentrationGame())
}
