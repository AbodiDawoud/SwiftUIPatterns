//
//  TruchetMazePattern.swift
//  SwiftUIPatterns

import SwiftUI


struct TruchetMazePatternView: View {
    var scaleColor1: Color = .teal.opacity(0.4)
    var scaleColor2: Color = .cyan.opacity(0.3)
    var strokeColor: Color = .white.opacity(0.8)
    var radius: CGFloat = 25
    
    var body: some View {
        GeometryReader { geometry in
            let w = radius * 2
            let h = radius * 1.2 // Overlap amount
            let cols = Int(geometry.size.width / w) + 2
            let rows = Int(geometry.size.height / h) + 2
            
            ZStack {
                ForEach(0..<rows, id: \.self) { row in
                    let y = CGFloat(row) * h
                    let xOffset = (row % 2 == 0) ? 0 : radius
                    
                    ForEach(-1..<cols, id: \.self) { col in
                        let x = CGFloat(col) * w + xOffset
                        
                        Circle()
                            .fill(row % 2 == 0 ? scaleColor1 : scaleColor2)
                            .overlay(Circle().stroke(strokeColor, lineWidth: 2))
                            .frame(width: w, height: w)
                            .position(x: x + radius, y: y + radius)
                    }
                }
            }
        }
    }
}
