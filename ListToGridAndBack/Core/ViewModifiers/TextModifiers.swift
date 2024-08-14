//
//  TextModifiers.swift
//  ListToGridAndBack
//
//  Created by Aleksey Shepelev on 14.08.2024.
//

import SwiftUI


extension Text {
    func iosCaption1() -> some View {
        self.modifier(DefaultTextModifier(fontSize: 12))
    }
    
    func iosBody2() -> some View {
        self.modifier(DefaultTextModifier(fontSize: 14))
    }
    
    func ceraRoundPro16() -> some View {
        self.modifier(DefaultTextModifier(fontSize: 16))
    }
    
    func ceraRoundPro20() -> some View {
        self.modifier(DefaultTextModifier(fontSize: 20))
    }
    
    func sfPro10() -> some View {
        self.modifier(DefaultTextModifier(fontSize: 10))
    }
}

fileprivate struct DefaultTextModifier: ViewModifier {
    let fontSize: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: fontSize, weight: .regular, design: .default))
            .tracking(-0.01)
            .lineSpacing(2)
    }
}
