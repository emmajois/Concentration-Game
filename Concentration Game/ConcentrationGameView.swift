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
        GeometryReader { geometry in
            LazyVGrid(columns: columns(for: geometry.size)){
                ForEach(emojiGame.cards){ card in
                    CardView(card: card)
                        .onTapGesture {
                            emojiGame.choose(card)
                        }
                }
            }
            .padding()
        }
    }
    private func columns(for size: CGSize) -> [GridItem]{
        Array(repeating: GridItem(.flexible()), count: Int(size.width / 125))
    }
}

struct CardView: View {
    let card: ConcentrationGame<String>.Card

    
    var body: some View{
        GeometryReader { geometry in
            ZStack{
                if card.isFaceUp{
                    RoundedRectangle(cornerRadius: Card.cornerRadius).fill(.white)
                    RoundedRectangle(cornerRadius: Card.cornerRadius).stroke()
                    Text(card.content)
                        .font(systemFont(for: geometry.size))
                } else{
                    RoundedRectangle(cornerRadius: Card.cornerRadius)
                }
            }
            .foregroundStyle(.blue)
        }
        .aspectRatio(Card.aspectRatio, contentMode: .fit)
    }
    
    //MARK: - Drawing constants
    private struct Card {
        static let aspectRatio: Double = 2/3
        static let cornerRadius = 10.0
        static let fontScaleFactor = 0.75
    }
    
    private func systemFont(for size: CGSize) -> Font {
        .system(size: min(size.width, size.height) * Card.fontScaleFactor)
    }
}

#Preview {
    ConcentrationGameView(emojiGame: EmojiConcentrationGame())
}
