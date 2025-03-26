//
//  ContentView.swift
//  SwiftUIPatterns
    
import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                CardView()
                
                
                PatternPreviewView(
                    pattern: "Grid",
                    systemIcon: "grid",
                    color: .blue,
                    destination: AnyView(GridPatternView(gridColor: .gray.opacity(0.2)) )
                )
                
                
                PatternPreviewView(
                    pattern: "Dashed Grid",
                    systemIcon: "app.dashed",
                    color: .orange,
                    destination: AnyView(DashedGridPatternView(gridColor: .gray.opacity(0.4)))
                )
                
                
                PatternPreviewView(
                    pattern: "Hexagonal Grid",
                    systemIcon: "hexagon",
                    color: .purple,
                    destination: AnyView(HexagonalGridPatternView())
                )
                
                
                PatternPreviewView(
                    pattern: "Dot Pattern",
                    systemIcon: "ellipsis",
                    color: .teal,
                    destination: AnyView(DotPatternView())
                )
                
                
                PatternPreviewView(
                    pattern: "Wave Pattern",
                    systemIcon: "water.waves",
                    color: .brown,
                    destination: AnyView(WavePatternView(numberOfWaves: 7) )
                )
                
                
                PatternPreviewView(
                    pattern: "Diagonal Stripe",
                    systemIcon: "line.diagonal",
                    color: .pink,
                    destination: AnyView(DiagonalStripePatternView(stripeWidth: 4, stripeSpacing: 40) )
                )
                
                
                PatternPreviewView(
                    pattern: "Checkerboard",
                    systemIcon: "rectangle.pattern.checkered",
                    color: .indigo,
                    destination: AnyView(CheckerboardPatternView() )
                )
            }
            .listSectionSpacing(20)
        }
    }
}


private struct PatternPreviewView: View {
    let pattern: String
    let systemIcon: String
    let color: Color
    let destination: AnyView
    
    var body: some View {
        Section {
            DisclosureGroup {
                Rectangle()
                    .foregroundColor(color)
                    .blur(radius: 120)
                    .padding(.leading, -20) // remove the default padding
                    .listRowSeparator(.hidden)
                    .background { destination.frame(height: 180) }
                    .frame(minWidth: 400, minHeight: 145)
            } label: {
                disclosureGroupLabel
            }.foregroundStyle(.primary, .gray)
        }
    }
    
    var disclosureGroupLabel: some View {
        HStack(spacing: 12) {
            Image(systemName: systemIcon)
                .foregroundStyle(color)
                .fontWeight(.semibold)
                .frame(width: 28, height: 28)
                .padding(4)
                .background(color.tertiary, in: .buttonBorder)
            
            Text(pattern)
        }
    }
}



private struct CardView: View {
    var body: some View {
        Section {
            HStack {
                Text("") // to have full row separator
                
                VStack(alignment: .center, spacing: 0.2) {
                    Text("SwiftUI Patterns")
                        .font(.title.bold().smallCaps()).fontDesign(.rounded)
                }
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, minHeight: 125)
            }
            
            DisclosureGroup("Overview") {
                Text("Explore the patterns to see how they can be applied in your SwiftUI projects.")
                    .foregroundStyle(.secondary)
                    .padding(.leading, -20) // remove the default padding
                    .listRowSeparator(.hidden)
            }
        }
    }
}
