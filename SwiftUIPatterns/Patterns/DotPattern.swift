//
//  DotPatternView.swift
//  SwiftUIPatterns

import SwiftUI


struct DotPatternView: View {
    var dotColor: Color = .gray.opacity(0.15)
    var dotSize: CGFloat = 5
    var spacing: CGFloat = 20
    
    var body: some View {
        GeometryReader { geometry in
            let rows = Int(geometry.size.height / spacing)
            let columns = Int(geometry.size.width / spacing)
            
            VStack(spacing: spacing) {
                ForEach(0..<rows, id: \.self) { _ in
                    HStack(spacing: spacing) {
                        ForEach(0..<columns, id: \.self) { _ in
                            Circle()
                                .fill(dotColor)
                                .frame(width: dotSize, height: dotSize)
                        }
                    }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
    }
}
