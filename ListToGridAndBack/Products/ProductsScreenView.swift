//
//  ProductsScreenView.swift
//  ListToGridAndBack
//
//  Created by Aleksey Shepelev on 13.08.2024.
//

import SwiftUI

struct ProductsScreenView: View {
    @StateObject private var productsViewModel: ProductsViewModel = ProductsViewModel()
    
    var body: some View {
        ZStack(alignment: .center) {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        AnimatedViewSwitcher()
                            .environmentObject(productsViewModel)
                        
                        Spacer()
                    }
                    .padding(.leading, 8)
                    
                    Divider()
                    
                    Spacer().frame(height: 20)
                    
                    switch productsViewModel.fetchingState {
                    case .loading:
                        EmptyView()
                    case .error:
                        EmptyView()
                    case .loaded(let products):
                        innerBody(products: products)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .refreshable {
                productsViewModel.loadData()
            }
            
            if case .loading = productsViewModel.fetchingState {
                ProgressView()
            }
        }
    }
    
    @ViewBuilder
    private func innerBody(products: [Product]) -> some View {
        switch productsViewModel.viewState {
        case .grid:
            ProductsGridView(products: products)
                .environmentObject(productsViewModel)
        case .list:
            ProductsListView(products: products)
                .environmentObject(productsViewModel)
        }
    }
}

#Preview {
    ProductsScreenView()
}
