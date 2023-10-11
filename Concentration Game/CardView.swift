//
//  CardView.swift
//  Concentration Game
//
//  Created by IS 543 on 10/10/23.
//

import SwiftUI

struct CardView: View {
    let card: ConcentrationGame<String>.Card

    
    var body: some View{
        GeometryReader { geometry in
            ZStack{
                if !card.isMatched || card.isFaceUp {
                    if card.isFaceUp{
                        RoundedRectangle(cornerRadius: Card.cornerRadius).fill(.white)
                        RoundedRectangle(cornerRadius: Card.cornerRadius).stroke()
                        Pie(startAngle: Angle(degrees: 360-90), endAngle: Angle(degrees: 105-90))
                            .opacity(0.4)
                            .padding()
                        Text(card.content)
                            .font(systemFont(for: geometry.size))
                    } else{
                        RoundedRectangle(cornerRadius: Card.cornerRadius)
                    }
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
    CardView(card: ConcentrationGame<String>.Card(isFaceUp:true, content: "🐙", id: 13))
        .padding(50)
}
