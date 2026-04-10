//
//  CrossPattern.swift
//  SwiftUIPatterns

import SwiftUI

struct CrossPatternView: View {
    var crossColor: Color = .gray.opacity(0.3)
    var crossSize: CGFloat = 20
    var thickness: CGFloat = 6
    var spacing: CGFloat = 40
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let cols = Int(geometry.size.width / spacing) + 2
                let rows = Int(geometry.size.height / spacing) + 2
                
                for row in -1...rows {
                    for col in -1...cols {
                        let cx = CGFloat(col) * spacing + (row % 2 == 0 ? 0 : spacing / 2)
                        let cy = CGFloat(row) * spacing
                        
                        // Vertical rect
                        path.addRect(CGRect(x: cx - thickness/2, y: cy - crossSize/2, width: thickness, height: crossSize))
                        // Horizontal rect
                        path.addRect(CGRect(x: cx - crossSize/2, y: cy - thickness/2, width: crossSize, height: thickness))
                    }
                }
            }
            .fill(crossColor)
        }
    }
}
