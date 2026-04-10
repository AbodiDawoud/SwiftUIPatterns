//
//  BrickPattern.swift
//  SwiftUIPatterns

import SwiftUI

struct BrickPatternView: View {
    var brickColor: Color = .red.opacity(0.6)
    var mortarColor: Color = .gray.opacity(0.3)
    var brickWidth: CGFloat = 60
    var brickHeight: CGFloat = 25
    var mortarThickness: CGFloat = 4
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                mortarColor // Background is mortar
                
                Path { path in
                    let rows = Int(geometry.size.height / brickHeight) + 2
                    let cols = Int(geometry.size.width / brickWidth) + 2
                    
                    for row in -1...rows {
                        let isOffset = row % 2 != 0
                        let xOffset = isOffset ? brickWidth / 2 : 0
                        
                        for col in -1...cols {
                            let x = CGFloat(col) * brickWidth - xOffset
                            let y = CGFloat(row) * brickHeight
                            
                            let rect = CGRect(
                                x: x + mortarThickness / 2,
                                y: y + mortarThickness / 2,
                                width: brickWidth - mortarThickness,
                                height: brickHeight - mortarThickness
                            )
                            path.addRect(rect)
                        }
                    }
                }
                .fill(brickColor)
            }
        }
    }
}
