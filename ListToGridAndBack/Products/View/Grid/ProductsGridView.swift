//
//  ProductsGridView.swift
//  ListToGridAndBack
//
//  Created by Aleksey Shepelev on 14.08.2024.
//

import SwiftUI

struct ProductsGridView: View {
    @EnvironmentObject private var viewModel: ProductsViewModel
    
    let products: [Product]
    
    let columns = [
        GridItem(.fixed((UIScreen.main.bounds.width - 28) / 2)),
        GridItem(.fixed((UIScreen.main.bounds.width - 28) / 2))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(products.indices, id: \.self) { index in
                let product = products[index]
                
                ProductGridItemView(product: product, selectedProductInfo: viewModel.cartProducts[product.id])
            }
        }
    }
}

#Preview {
    ProductsGridView(products: [Product(id: UUID(), imagePath: "food-1", rating: 4.1, reviewCount: 1001, name: "hello world привет мир михао гамарджоба", kgPrice: 25, previousPrice: 13, productOrigin: "Франция 🇫🇷", badge: "Свежий носок", discount: 90)])
        .environmentObject(ProductsViewModel())
}
