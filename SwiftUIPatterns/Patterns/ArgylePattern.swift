//
//  ArgylePattern.swift
//  SwiftUIPatterns

import SwiftUI

struct ArgylePatternView: View {
    var diamondColor: Color = .gray.opacity(0.15)
    var lineColor: Color = .gray.opacity(0.4)
    var patternWidth: CGFloat = 60
    var patternHeight: CGFloat = 90
    
    var body: some View {
        GeometryReader { geometry in
            let columns = Int(geometry.size.width / patternWidth) + 2
            let rows = Int(geometry.size.height / patternHeight) + 2
            
            ZStack {
                // Diamonds
                Path { path in
                    for row in -1...rows {
                        for col in -1...columns {
                            let xOffset = CGFloat(col) * patternWidth + (row % 2 == 0 ? 0 : patternWidth / 2)
                            let yOffset = CGFloat(row) * (patternHeight / 2)
                            
                            path.move(to: CGPoint(x: xOffset, y: yOffset - patternHeight / 2))
                            path.addLine(to: CGPoint(x: xOffset + patternWidth / 2, y: yOffset))
                            path.addLine(to: CGPoint(x: xOffset, y: yOffset + patternHeight / 2))
                            path.addLine(to: CGPoint(x: xOffset - patternWidth / 2, y: yOffset))
                            path.closeSubpath()
                        }
                    }
                }
                .fill(diamondColor)
                
                // Crossing Dashed Lines
                Path { path in
                    let maxDim = max(geometry.size.width, geometry.size.height) * 2
                    let steps = Int(maxDim / min(patternWidth, patternHeight)) + 10
                    
                    for i in -steps...steps {
                        // Forward slash (/)
                        let startX1 = CGFloat(i) * patternWidth
                        let startY1: CGFloat = -maxDim
                        let endX1 = startX1 + maxDim * (patternWidth / patternHeight) * 2
                        let endY1 = startY1 + maxDim * 2
                        
                        path.move(to: CGPoint(x: startX1, y: startY1))
                        path.addLine(to: CGPoint(x: endX1, y: endY1))
                        
                        // Backslash (\)
                        let startX2 = CGFloat(i) * patternWidth
                        let startY2: CGFloat = -maxDim
                        let endX2 = startX2 - maxDim * (patternWidth / patternHeight) * 2
                        let endY2 = startY2 + maxDim * 2
                        
                        path.move(to: CGPoint(x: startX2, y: startY2))
                        path.addLine(to: CGPoint(x: endX2, y: endY2))
                    }
                }
                .stroke(lineColor, style: StrokeStyle(lineWidth: 1.5, dash: [6, 6]))
            }
        }
    }
}
