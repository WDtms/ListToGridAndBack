//
//  Product.swift
//  ListToGridAndBack
//
//  Created by Aleksey Shepelev on 13.08.2024.
//

import Foundation

struct Product: Identifiable {
    let id: UUID
    let imagePath: String
    let rating: Double
    let reviewCount: Int
    let name: String
    let kgPrice: Double
    let previousPrice: Double
    let productOrigin: String?
    let badge: String?
    let discount: Int?
}
