//
//  PlaidPattern.swift
//  SwiftUIPatterns

import SwiftUI

struct PlaidPatternView: View {
    var primaryColor: Color = .red.opacity(0.15)
    var secondaryColor: Color = .blue.opacity(0.2)
    var accentColor: Color = .yellow.opacity(0.4)
    var patternSize: CGFloat = 60
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Primary vertical stripes
                Path { path in
                    let cols = Int(geometry.size.width / patternSize) + 1
                    for i in 0...cols {
                        let x = CGFloat(i) * patternSize
                        path.addRect(CGRect(x: x + patternSize * 0.2, y: 0, width: patternSize * 0.4, height: geometry.size.height))
                    }
                }.fill(primaryColor)
                
                // Primary horizontal stripes
                Path { path in
                    let rows = Int(geometry.size.height / patternSize) + 1
                    for i in 0...rows {
                        let y = CGFloat(i) * patternSize
                        path.addRect(CGRect(x: 0, y: y + patternSize * 0.2, width: geometry.size.width, height: patternSize * 0.4))
                    }
                }.fill(primaryColor)
                
                // Secondary thin vertical stripes
                Path { path in
                    let cols = Int(geometry.size.width / patternSize) + 1
                    for i in 0...cols {
                        let x = CGFloat(i) * patternSize
                        path.addRect(CGRect(x: x + patternSize * 0.8, y: 0, width: patternSize * 0.1, height: geometry.size.height))
                    }
                }.fill(secondaryColor)
                
                // Secondary thin horizontal stripes
                Path { path in
                    let rows = Int(geometry.size.height / patternSize) + 1
                    for i in 0...rows {
                        let y = CGFloat(i) * patternSize
                        path.addRect(CGRect(x: 0, y: y + patternSize * 0.8, width: geometry.size.width, height: patternSize * 0.1))
                    }
                }.fill(secondaryColor)
                
                // Accent intersecting lines (thin)
                Path { path in
                    let cols = Int(geometry.size.width / patternSize) + 1
                    let rows = Int(geometry.size.height / patternSize) + 1
                    for i in 0...cols {
                        let x = CGFloat(i) * patternSize + patternSize * 0.4
                        path.move(to: CGPoint(x: x, y: 0))
                        path.addLine(to: CGPoint(x: x, y: geometry.size.height))
                    }
                    for i in 0...rows {
                        let y = CGFloat(i) * patternSize + patternSize * 0.4
                        path.move(to: CGPoint(x: 0, y: y))
                        path.addLine(to: CGPoint(x: geometry.size.width, y: y))
                    }
                }.stroke(accentColor, lineWidth: 1.5)
            }
        }
    }
}
