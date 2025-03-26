//
//  CheckerboardPatternView.swift
//  SwiftUIPatterns

import SwiftUI

struct CheckerboardPatternView: View {
    var squareColor: Color = .gray.opacity(0.15)
    var squareSize: CGFloat = 10
    
    var body: some View {
        GeometryReader { geometry in
            let rows = Int(geometry.size.height / squareSize)
            let columns = Int(geometry.size.width / squareSize)
            
            ForEach(0..<rows, id: \.self) { row in
                ForEach(0..<columns, id: \.self) { column in
                    Rectangle()
                        .fill((row + column) % 2 == 0 ? squareColor : Color.clear)
                        .frame(width: squareSize, height: squareSize)
                        .position(x: CGFloat(column) * squareSize + squareSize / 2,
                                  y: CGFloat(row) * squareSize + squareSize / 2)
                }
            }
        }
    }
}
