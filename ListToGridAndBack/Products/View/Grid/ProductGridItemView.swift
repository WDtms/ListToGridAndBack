//
//  ProductGridItemView.swift
//  ListToGridAndBack
//
//  Created by Aleksey Shepelev on 14.08.2024.
//

import SwiftUI

struct ProductGridItemView: View {
    let product: Product
    let selectedProductInfo: SelectedProductInfo?
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0.0) {
                ZStack(alignment: .bottom) {
                    Image(product.imagePath)
                        .resizable()
                        .scaledToFit()
                    
                    HStack {
                        
                        RatingView(rating: product.rating, reviewCount: nil)
                        
                        Spacer()
                        
                        if let discount = product.discount {
                            Text("\(String(discount))%")
                                .ceraRoundPro16()
                                .foregroundColor(AppColors.redColor)
                        }
                    }
                    .padding(.horizontal, 4)
                }
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .iosCaption1()
                        .foregroundStyle(AppColors.textIcons2)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    if let selectedProductInfo = selectedProductInfo {
                        ProductPickerView(selectedProductInfo: selectedProductInfo)
                    } else {
                        UnselectedProductButtonView(product: product)
                    }
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                
            }
            
            HStack(alignment: .top) {
                if let badgeText = product.badge {
                    BadgeView(badgeText: badgeText)
                }
                
                Spacer()
                
                ProductHelpButtonsView()
            }
        }
        .background(Color.white)
        .frame(height: 278)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: AppColors.shadowColor, radius: 8, x: 0, y: 0)
    }
}

#Preview {
    ProductGridItemView(product: Product(id: UUID(), imagePath: "food-1", rating: 4.1, reviewCount: 1001, name: "hello world привет мир михао гамарджоба", kgPrice: 25, previousPrice: 13, productOrigin: "Франция 🇫🇷", badge: "Свежий носок", discount: 90), selectedProductInfo: nil)}
