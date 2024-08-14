//
//  PricesUtils.swift
//  ListToGridAndBack
//
//  Created by Aleksey Shepelev on 14.08.2024.
//

import Foundation

enum DoubleUtils {
    static func getDoubleWithTwoSymbolsAfterDivider(double: Double) -> String {
        String(format: "%.2f", double)
    }
    
    static func getDoubleWithOneSymbolAfterDivider(double: Double) -> String {
        String(format: "%.1f", double)
    }
    
    static func getIntegerPart(of double: Double) -> String {
        return String(Int(double))
    }
    
    static func getFractionalPart(of double: Double) -> String {
        let fractionalPart = double.truncatingRemainder(dividingBy: 1)
        let fractionalInt = Int(fractionalPart * 100)
        return String(format: "%02d", fractionalInt)
    }
}
