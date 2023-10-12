//
//  Cardify.swift
//  Concentration Game
//
//  Created by IS 543 on 10/11/23.
//

import SwiftUI

struct Cardify: ViewModifier {
    let isFaceUp: Bool

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            ZStack {
                if isFaceUp{
                    RoundedRectangle(cornerRadius: cornerRadius(for: geometry.size)).fill(.white)
                    RoundedRectangle(cornerRadius: cornerRadius(for: geometry.size)).stroke()
                    content
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius(for: geometry.size))
                }
            }
        }
    }
    
    //MARK: - Drawing constants
    private func cornerRadius (for size: CGSize) -> Double {
        min(size.width, size.height) * 0.08
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
