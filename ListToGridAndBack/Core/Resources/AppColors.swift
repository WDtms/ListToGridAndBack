//
//  AppColors.swift
//  ListToGridAndBack
//
//  Created by Aleksey Shepelev on 14.08.2024.
//

import Foundation
import SwiftUI

enum AppColors {
    static let textIcons = Color(hex: "#262626")
    static let textIcons1 = Color(hex: "#262626", opacity: 0.60)
    static let textIcons2 = Color(hex: "#262626", opacity: 0.80)
    static let primary = Color(hex: "#15B742")
    static let blueColor = Color(hex: "#7A79BA", opacity: 0.90)
    static let shadowColor = Color(hex: "#8B8B8B", opacity: 0.20)
    static let redColor = Color(hex: "#C32323")
}

extension Color {
    init(hex: String, opacity: Double = 1.0) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255 * opacity
        )
    }
}
