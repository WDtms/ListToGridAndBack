//
//  ListView.swift
//  ListToGridAndBack
//
//  Created by Aleksey Shepelev on 14.08.2024.
//

import SwiftUI

struct ProductsListView: View {
    @EnvironmentObject private var viewModel: ProductsViewModel
    
    let products: [Product]
    
    var body: some View {
        LazyVStack(content: {
            ForEach(products.indices, id: \.self) { index in
                let product = products[index]
                
                ProductListItemView(product: product, selectedProductInfo: viewModel.cartProducts[product.id])
                
                if (index != products.indices.last) {
                    Divider()
                        .padding(.vertical, 16)
                }
            }
        })
    }
}

#Preview {
    ProductsListView(products: [Product(id: UUID(), imagePath: "food-1", rating: 4.1, reviewCount: 1001, name: "hello world привет мир михао гамарджоба", kgPrice: 25, previousPrice: 13, productOrigin: "Франция 🇫🇷", badge: "Свежий носок", discount: 90)])
        .environmentObject(ProductsViewModel())
}
