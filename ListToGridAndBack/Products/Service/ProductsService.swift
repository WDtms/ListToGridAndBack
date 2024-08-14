//
//  ProductsService.swift
//  ListToGridAndBack
//
//  Created by Aleksey Shepelev on 13.08.2024.
//

import Foundation

class ProductsService {
    private let names: [String] = ["Хлеб", "Батон", "Сыр", "Вода вода вода с хлебом и сыром, и бантоном", "Конфеты 200 гр.", "Арбуз", "Помидоры", "Огурцы"]
    
    lazy private var badges: [String?] = {
        var array = Array<String?>(repeating: nil, count: 8)
        
        array.append("Новинки сезона")
        array.append("Цена по карте")
        array.append("Урви сейчас")
        
        return array
    }()
    
    static let shared: ProductsService = ProductsService()
    
    private init() {}
    
    func loadProducts() async throws -> [Product] {
        try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
        
        return (0..<20).map { _ in
            generateProduct()
        }
    }
    
    private func generateProduct() -> Product {
        Product(
            id: UUID(),
            imagePath: "food-\(Int.random(in: 1...13))",
            rating: Double.random(in: 0.1...5.0),
            reviewCount: Int.random(in: 1...1001),
            name: names.randomElement()!,
            kgPrice: Double.random(in: 5.0...500.0),
            previousPrice: Double.random(in: 5.0...500.0),
            productOrigin: Bool.random() ? "Франция 🇫🇷" : nil,
            badge: badges.randomElement()!,
            discount: Bool.random() ? Int.random(in: 10...90) : nil
        )
    }
}
