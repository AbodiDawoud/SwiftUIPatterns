//
//  SwiftUIPatternsApp.swift
//  SwiftUIPatterns
    

import SwiftUI

@main
struct SwiftUIPatternsApp: App {
    @AppStorage("app_appearance") var appAppearance: String?
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(stringToColorScheme())
                .onShake {
                    self.appAppearance = self.appAppearance == "light" ? "dark" : "light"
                }
        }
    }

    func stringToColorScheme() -> ColorScheme? {
        guard let appAppearance else { return nil }
        
        switch appAppearance.lowercased() {
        case "light": return .light
        default: return .dark
        }
    }
}
