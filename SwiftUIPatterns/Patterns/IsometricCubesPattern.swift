//
//  IsometricCubesPattern.swift
//  SwiftUIPatterns

import SwiftUI

struct IsometricCubesPatternView: View {
    var topColor: Color = .gray.opacity(0.3)
    var leftColor: Color = .gray.opacity(0.5)
    var rightColor: Color = .gray.opacity(0.2)
    var cubeSize: CGFloat = 20
    
    var body: some View {
        GeometryReader { geometry in
            let w = cubeSize * CGFloat(sqrt(3.0))
            let h = cubeSize * 1.5
            let cols = Int(geometry.size.width / w) + 2
            let rows = Int(geometry.size.height / h) + 2
            
            ZStack {
                // Top Faces
                Path { path in
                    for row in -1...rows {
                        for col in -1...cols {
                            let cx = CGFloat(col) * w + (row % 2 == 0 ? 0 : w / 2)
                            let cy = CGFloat(row) * h
                            
                            let p0 = CGPoint(x: cx, y: cy - cubeSize)
                            let p1 = CGPoint(x: cx + w/2, y: cy - cubeSize/2)
                            let p5 = CGPoint(x: cx - w/2, y: cy - cubeSize/2)
                            
                            path.move(to: CGPoint(x: cx, y: cy))
                            path.addLine(to: p5)
                            path.addLine(to: p0)
                            path.addLine(to: p1)
                            path.closeSubpath()
                        }
                    }
                }.fill(topColor)
                
                // Left Faces
                Path { path in
                    for row in -1...rows {
                        for col in -1...cols {
                            let cx = CGFloat(col) * w + (row % 2 == 0 ? 0 : w / 2)
                            let cy = CGFloat(row) * h
                            
                            let p3 = CGPoint(x: cx, y: cy + cubeSize)
                            let p4 = CGPoint(x: cx - w/2, y: cy + cubeSize/2)
                            let p5 = CGPoint(x: cx - w/2, y: cy - cubeSize/2)
                            
                            path.move(to: CGPoint(x: cx, y: cy))
                            path.addLine(to: p5)
                            path.addLine(to: p4)
                            path.addLine(to: p3)
                            path.closeSubpath()
                        }
                    }
                }.fill(leftColor)
                
                // Right Faces
                Path { path in
                    for row in -1...rows {
                        for col in -1...cols {
                            let cx = CGFloat(col) * w + (row % 2 == 0 ? 0 : w / 2)
                            let cy = CGFloat(row) * h
                            
                            let p1 = CGPoint(x: cx + w/2, y: cy - cubeSize/2)
                            let p2 = CGPoint(x: cx + w/2, y: cy + cubeSize/2)
                            let p3 = CGPoint(x: cx, y: cy + cubeSize)
                            
                            path.move(to: CGPoint(x: cx, y: cy))
                            path.addLine(to: p3)
                            path.addLine(to: p2)
                            path.addLine(to: p1)
                            path.closeSubpath()
                        }
                    }
                }.fill(rightColor)
            }
        }
    }
}
