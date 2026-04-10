//
//  ConcentricCirclesPattern.swift
//  SwiftUIPatterns

import SwiftUI

struct ConcentricCirclesPatternView: View {
    var circleColor: Color = .gray.opacity(0.2)
    var spacing: CGFloat = 20
    var lineWidth: CGFloat = 1.5
    var centerOffset: CGPoint = CGPoint(x: 0, y: 0) // Shift center if desired
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let center = CGPoint(
                    x: geometry.size.width / 2 + centerOffset.x,
                    y: geometry.size.height / 2 + centerOffset.y
                )
                
                // Calculate max distance to corner to ensure rings fill the screen
                let corners = [
                    CGPoint(x: 0, y: 0),
                    CGPoint(x: geometry.size.width, y: 0),
                    CGPoint(x: 0, y: geometry.size.height),
                    CGPoint(x: geometry.size.width, y: geometry.size.height)
                ]
                
                let maxRadius = corners.map { hypot($0.x - center.x, $0.y - center.y) }.max() ?? 0
                let count = Int(maxRadius / spacing) + 1
                
                for i in 1...count {
                    let radius = CGFloat(i) * spacing
                    path.addEllipse(in: CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2))
                }
            }
            .stroke(circleColor, lineWidth: lineWidth)
        }
    }
}
