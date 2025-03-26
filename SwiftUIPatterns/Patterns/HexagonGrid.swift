//
//  HexagonGridPatternView.swift
//  SwiftUIPatterns

import SwiftUI



struct HexagonalGridPatternView: View {
    var hexColor: Color = .gray.opacity(0.15)
    var hexSize: CGFloat = 20
    
    var body: some View {
        GeometryReader { geometry in
            let columns = Int(geometry.size.width / (hexSize * 1.5))
            let rows = Int(geometry.size.height / (hexSize * sqrt(3)))
            
            ForEach(0..<rows, id: \.self) { row in
                ForEach(0..<columns, id: \.self) { column in
                    innrPath(column, row: row)
                }
            }
        }
    }
    
    func innrPath(_ column: Int, row: Int) -> some View {
        let xOffset = CGFloat(column) * hexSize * 1.5
        let yOffset = CGFloat(row) * hexSize * sqrt(3) + (column % 2 == 0 ? 0 : hexSize * sqrt(3) / 2)
        
        return Path { path in
            let center = CGPoint(x: xOffset, y: yOffset)
            for i in 0..<6 {
                let angle = CGFloat(i) * .pi / 3
                let point = CGPoint(x: center.x + hexSize * cos(angle),
                                    y: center.y + hexSize * sin(angle))
                if i == 0 {
                    path.move(to: point)
                } else {
                    path.addLine(to: point)
                }
            }
            path.closeSubpath()
        }
        .stroke(hexColor, lineWidth: 1)
    }
}
