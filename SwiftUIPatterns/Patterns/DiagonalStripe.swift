//
//  DiagonalStripePatternView.swift
//  SwiftUIPatterns

import SwiftUI


struct DiagonalStripePatternView: View {
    var stripeColor: Color = .gray.opacity(0.15)
    var stripeWidth: CGFloat = 10
    var stripeSpacing: CGFloat = 30
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                let diagonalWidth = sqrt(width * width + height * height)
                
                // Adjust the stride to account for stripe width and spacing
                for x in stride(from: -diagonalWidth, through: diagonalWidth, by: stripeWidth + stripeSpacing) {
                    path.move(to: CGPoint(x: x, y: 0))
                    path.addLine(to: CGPoint(x: x + diagonalWidth, y: diagonalWidth))
                }
            }
            .stroke(stripeColor, lineWidth: stripeWidth)
        }
    }
}
