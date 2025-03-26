//
//  GridPatternView.swift
//  SwiftUIPatterns


import SwiftUI


struct GridPatternView: View {
    var gridCells = 4
    var gridColor: Color = .gray.opacity(0.15)
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                for index in 1...(gridCells-1) {
                    let vOffset: CGFloat = geometry.size.width / CGFloat(gridCells) * CGFloat(index)
                    path.move(to: CGPoint(x: vOffset, y: 0))
                    path.addLine(to: CGPoint(x: vOffset, y: geometry.size.height))
                }
                for index in 1...(gridCells-1) {
                    let hOffset: CGFloat = geometry.size.height / CGFloat(gridCells) * CGFloat(index)
                    path.move(to: CGPoint(x: 0, y: hOffset))
                    path.addLine(to: CGPoint(x: geometry.size.width, y: hOffset))
                }
            }
            .stroke()
            .fill(gridColor)
        }
    }
}



struct DashedGridPatternView: View {
    var gridCells: Int = 4
    var gridColor: Color = .gray.opacity(0.15)
    var dashPattern: [CGFloat] = [5, 5] // Length of dashes and gaps
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                // Vertical lines
                for index in 1...(gridCells - 1) {
                    let xOffset = geometry.size.width / CGFloat(gridCells) * CGFloat(index)
                    path.move(to: CGPoint(x: xOffset, y: 0))
                    path.addLine(to: CGPoint(x: xOffset, y: geometry.size.height))
                }
                
                // Horizontal lines
                for index in 1...(gridCells - 1) {
                    let yOffset = geometry.size.height / CGFloat(gridCells) * CGFloat(index)
                    path.move(to: CGPoint(x: 0, y: yOffset))
                    path.addLine(to: CGPoint(x: geometry.size.width, y: yOffset))
                }
            }
            .stroke(style: StrokeStyle(lineWidth: 1, dash: dashPattern))
            .fill(gridColor)
        }
    }
}
