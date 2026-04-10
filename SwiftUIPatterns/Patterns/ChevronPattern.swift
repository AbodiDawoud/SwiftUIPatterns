//
//  ChevronPattern.swift
//  SwiftUIPatterns

import SwiftUI

struct ChevronPatternView: View {
    var chevronColor: Color = .gray.opacity(0.3)
    var chevronWidth: CGFloat = 30
    var chevronHeight: CGFloat = 20
    var lineWidth: CGFloat = 3
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let columns = Int(geometry.size.width / chevronWidth) + 2
                let rows = Int(geometry.size.height / chevronHeight) + 2
                
                for row in -1...rows {
                    for col in -1...columns {
                        let startX = CGFloat(col) * chevronWidth
                        let startY = CGFloat(row) * chevronHeight
                        
                        path.move(to: CGPoint(x: startX, y: startY))
                        path.addLine(to: CGPoint(x: startX + chevronWidth / 2, y: startY + chevronHeight / 2))
                        path.addLine(to: CGPoint(x: startX + chevronWidth, y: startY))
                    }
                }
            }
            .stroke(chevronColor, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
        }
    }
}
