//
//  ProductPickerView.swift
//  ListToGridAndBack
//
//  Created by Aleksey Shepelev on 14.08.2024.
//

import SwiftUI

extension SelectedProductInfo {
    var formattedCount: String {
        let count = DoubleUtils.getDoubleWithTwoSymbolsAfterDivider(double: totalCount)
        
        return switch countedBy {
        case .kg:
            "\(count) кг"
        case .piece:
            "\(count) шт"
        }
    }
}

struct ProductPickerView: View {
    let selectedProductInfo: SelectedProductInfo
    
    @EnvironmentObject private var viewModel: ProductsViewModel
    @State private var isByPiece: Bool
    
    init(selectedProductInfo: SelectedProductInfo) {
        self.selectedProductInfo = selectedProductInfo
        self._isByPiece = State(wrappedValue: selectedProductInfo.countedBy == .piece)
    }
    
    var body: some View {
        VStack {
            Picker(selection: $isByPiece) {
                Text("Шт")
                    .iosBody2()
                    .tag(true)
        
                Text("Кг")
                    .iosBody2()
                    .tag(false)
            } label: {
                Text("")
            }
            .pickerStyle(SegmentedPickerStyle())
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .frame(height: 28)
            .onChange(of: isByPiece) { oldValue, newValue in
                viewModel.changeCountedBy(id: selectedProductInfo.id)
            }
            
            Spacer()
                .frame(height: 8)
            
            HStack(spacing: 0.0) {
                changePriceButton(imageSystemName: "minus") {
                    viewModel.decreaseProductCount(id: selectedProductInfo.id)
                }
                
                Spacer()
                
                priceBody
                    .padding(.vertical, 2)
                
                Spacer()
                
                changePriceButton(imageSystemName: "plus") {
                    viewModel.increaseProductCount(id: selectedProductInfo.id)
                }
     
            }
            .background(AppColors.primary)
            .clipShape(RoundedRectangle(cornerRadius: 40))
        }
    }
    
    @ViewBuilder
    private var priceBody: some View {
        VStack(spacing: 4) {
            Text(selectedProductInfo.formattedCount)
                .foregroundStyle(Color.white)
                .ceraRoundPro16()
            
            Text("~\(DoubleUtils.getDoubleWithTwoSymbolsAfterDivider(double: selectedProductInfo.totalPrice)) ₽")
                .foregroundStyle(Color.white)
                .iosCaption1()
        }
    }
    
    private func changePriceButton(imageSystemName: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            Image(systemName: imageSystemName)
                .frame(height: 36)
                .foregroundColor(.white)
                .padding(.horizontal, 11)
        }
    }
}

#Preview {
    ProductPickerView(selectedProductInfo: SelectedProductInfo(id: UUID(), productPrice: 24123.12, totalPrice: 124, totalCount: 12, countedBy: SelectedProductInfo.CountedBy.piece))
}
