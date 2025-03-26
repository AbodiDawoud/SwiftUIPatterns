//
//  WavePatternView.swift
//  SwiftUIPatterns

import SwiftUI


struct WavePatternView: View {
    var waveColor: Color = .gray.opacity(0.3)
    var waveHeight: CGFloat = 14
    var waveLength: CGFloat = 40
    var numberOfWaves: Int = 6
    var phaseShift: CGFloat = 0.3
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<numberOfWaves, id: \.self) { i in
                    WaveShape(waveHeight: waveHeight  / CGFloat(numberOfWaves),
                              waveLength: waveLength,
                              phase: CGFloat(i) * phaseShift)
                    .stroke(waveColor, lineWidth: 2)
                    .offset(y: CGFloat(i) * waveHeight * 2)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
        }
    }
    
    private struct WaveShape: Shape {
        var waveHeight: CGFloat
        var waveLength: CGFloat
        var phase: CGFloat
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            path.move(to: CGPoint(x: 0, y: 0))
            
            for x in stride(from: 0, through: rect.width, by: 1) {
                let relativeX = x / waveLength
                let y = waveHeight * sin(relativeX * .pi * 2 + phase * .pi * 2)
                path.addLine(to: CGPoint(x: x, y: y))
            }
            
            return path
        }
    }
}
