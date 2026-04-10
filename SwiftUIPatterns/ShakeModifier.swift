//
//  ShakeModifier.swift
//  SwiftUIPatterns
    

import SwiftUI

public extension Notification.Name {
    static let shakeEnded = Notification.Name("ShakeEnded")
}

public extension UIWindow {
     override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: .shakeEnded, object: nil)
        }
         
        super.motionEnded(motion, with: event)
     }
}

fileprivate struct _ShakeDetector: ViewModifier {
    let onShake: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: .shakeEnded)) { _ in
                onShake()
            }
    }
}

public extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(_ShakeDetector(onShake: action))
    }
}
