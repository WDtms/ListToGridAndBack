//
//  ProductsViewModel.swift
//  ListToGridAndBack
//
//  Created by Aleksey Shepelev on 13.08.2024.
//

import Foundation

@MainActor
class ProductsViewModel: ObservableObject {
    
    init() {
        loadData()
    }
    
    @Published var viewState: ProductsViewState = .grid
    
    @Published var fetchingState: ProductsFetchingState = .loading
    
    @Published var cartProducts: [UUID: SelectedProductInfo] = [:]
    
    func loadData() {
        fetchingState = .loading
        
        Task {
            do {
                let products = try await ProductsService.shared.loadProducts()
                
                fetchingState = .loaded(products: products)
            } catch {
                fetchingState = .error
            }
        }
    }
    
    func toggleViewState() {
        viewState = viewState == .grid ? .list : .grid
    }
    
    func addProductToCart(product: Product) {
        cartProducts[product.id] = SelectedProductInfo(
            id: product.id,
            productPrice: product.kgPrice,
            totalPrice: SelectedProductInfo.countBareMinimum * product.kgPrice,
            totalCount: SelectedProductInfo.countBareMinimum,
            countedBy: SelectedProductInfo.CountedBy.kg
        )
    }
    
    func increaseProductCount(id: UUID) {
        guard var product = cartProducts[id] else { return }
        
        product.totalCount += product.countedBy.minimum
        recalculateTotalPrice(product: &product)
        
        cartProducts[id] = product
    }
    
    func decreaseProductCount(id: UUID) {
        guard var product = cartProducts[id] else { return }
        
        product.totalCount -= product.countedBy.minimum
        recalculateTotalPrice(product: &product)
        
        cartProducts[id] = product
    }
    
    func changeCountedBy(id: UUID) {
        guard var product = cartProducts[id] else { return }
        
        switch product.countedBy {
        case .kg:
            product.countedBy = .piece
            product.totalCount = SelectedProductInfo.CountedBy.piece.minimum
            recalculateTotalPrice(product: &product)
        case .piece:
            product.countedBy = .kg
            product.totalCount = SelectedProductInfo.CountedBy.kg.minimum
            recalculateTotalPrice(product: &product)
        }
        
        cartProducts[id] = product
    }
    
    private func recalculateTotalPrice(product: inout SelectedProductInfo) {
        product.totalPrice = product.totalCount * product.productPrice
    }
    
    enum ProductsFetchingState {
        case loading
        case error
        case loaded(products: [Product])
    }
    
    enum ProductsViewState {
        case grid
        case list
    }
}
