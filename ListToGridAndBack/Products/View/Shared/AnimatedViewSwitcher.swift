//
//  AnimatedViewSwitcher.swift
//  ListToGridAndBack
//
//  Created by Aleksey Shepelev on 14.08.2024.
//

import SwiftUI

struct AnimatedViewSwitcher: View {
    @EnvironmentObject private var productsViewModel: ProductsViewModel
    @Namespace private var animationNamespace
    
    private let sideSize: CGFloat = 7
    private let borderSize: CGFloat = 2

    
    var body: some View {
        Button {
            withAnimation(.bouncy(duration: 0.6)) {
                productsViewModel.toggleViewState()
            }
        } label: {
            iconView
        }
    }
    
    @ViewBuilder
    private var iconView: some View {
        VStack(spacing: borderSize) {
            switch productsViewModel.viewState {
            case .grid:
                gridView
            case .list:
                listView
            }
        }
        .padding(.all, 12)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    @ViewBuilder
    private var gridView: some View {
        ForEach(0..<2) { row in
            HStack(spacing: borderSize) {
                ForEach(0..<2) { column in
                    Rectangle()
                        .commonIconModifiers(borderSize: borderSize)
                        .frame(width: sideSize, height: sideSize)
                        .matchedGeometryEffect(id: "\(row)\(column)", in: animationNamespace)
                }
            }
        }
    }
    
    @ViewBuilder
    private var listView: some View {
        ForEach(0..<2) { row in
            Rectangle()
                .commonIconModifiers(borderSize: borderSize)
                .frame(width: sideSize * 2 + borderSize, height: sideSize)
                .matchedGeometryEffect(id: "\(row)0", in: animationNamespace)
                .matchedGeometryEffect(id: "\(row)1", in: animationNamespace)
        }
    }
}

fileprivate extension Rectangle {
    func commonIconModifiers(borderSize: CGFloat) -> some View {
        self
            .fill(Color.white)
            .border(Color.green, width: borderSize)
            .clipShape(RoundedRectangle(cornerRadius: borderSize))
    }
}

#Preview {
    AnimatedViewSwitcher()
        .environmentObject(ProductsViewModel())
}
