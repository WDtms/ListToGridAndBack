//
//  UnselectedProductButtonView.swift
//  ListToGridAndBack
//
//  Created by Aleksey Shepelev on 14.08.2024.
//

import SwiftUI

struct UnselectedProductButtonView: View {
    let product: Product
    
    @EnvironmentObject private var viewModel: ProductsViewModel
    
    var body: some View {
        HStack(spacing: 2) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .top, spacing: 2) {
                    Text(DoubleUtils.getIntegerPart(of: product.kgPrice))
                        .foregroundStyle(AppColors.textIcons)
                        .ceraRoundPro20()
                    
                    Text(DoubleUtils.getFractionalPart(of: product.kgPrice))
                        .foregroundStyle(AppColors.textIcons)
                        .ceraRoundPro16()
                    
                    Image(AppIcons.rublesPerKilo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    
                    Spacer()
                }
                
                Text(DoubleUtils.getDoubleWithTwoSymbolsAfterDivider(double: product.previousPrice))
                    .foregroundStyle(AppColors.textIcons1)
                    .iosCaption1()
                    .strikethrough(true, color: AppColors.textIcons1)
            }
            
            Button {
                viewModel.addProductToCart(product: product)
            } label: {
                Image(AppIcons.cart)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
            }

            
        }
    }
}

#Preview {
    UnselectedProductButtonView(product: Product(id: UUID(), imagePath: "food-1", rating: 4.1, reviewCount: 1001, name: "hello world привет мир михао гамарджоба", kgPrice: 2512.25, previousPrice: 13, productOrigin: "Франция 🇫🇷", badge: "Свежий носок", discount: 90))
        .environmentObject(ProductsViewModel())
}
