//
//  ListItemView.swift
//  ListToGridAndBack
//
//  Created by Aleksey Shepelev on 14.08.2024.
//

import SwiftUI

struct ProductListItemView: View {
    let product: Product
    let selectedProductInfo: SelectedProductInfo?
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            HStack {
                let imageSize = UIScreen.main.bounds.width * 2/5
                
                ZStack(alignment: .bottomTrailing) {
                    Image(product.imagePath)
                        .resizable()
                        .frame(width: imageSize, height: imageSize)
                        .scaledToFit()
                    
                    if let discount = product.discount {
                        Text("\(String(discount))%")
                            .ceraRoundPro16()
                            .foregroundColor(AppColors.redColor)
                    }
                }
                

                
                Spacer()
                    .frame(width: 8)
                
                VStack(alignment: .leading, spacing: 0.0) {
                    HStack {
                        VStack(alignment: .leading, spacing: 0.0) {
                            RatingView(rating: product.rating, reviewCount: product.reviewCount)
                            
                            Spacer()
                                .frame(height: 4)
                            
                            Text(product.name)
                                .iosCaption1()
                                .foregroundStyle(AppColors.textIcons2)
                                .lineLimit(2)
                            
                            Spacer()
                                .frame(height: 4)
                            
                            if let productOrigin = product.productOrigin {
                                HStack {
                                    Text(productOrigin)
                                        .iosCaption1()
                                        .foregroundStyle(AppColors.textIcons1)
                                }
                            }
                        }
                        
                        Spacer()
                            .frame(width: 32)
                    }
                    
                    Spacer()
                    
                    if let selectedProductInfo = selectedProductInfo {
                        ProductPickerView(selectedProductInfo: selectedProductInfo)
                    } else {
                        UnselectedProductButtonView(product: product)
                    }

                }
                .frame(height: 144)
            }
            
            HStack(alignment: .top) {
                if let badgeText = product.badge {
                    BadgeView(badgeText: badgeText)
                }
                
                Spacer()
                
                ProductHelpButtonsView()
            }
            
    
            
        }
        .padding(.leading, 16)
        .padding(.trailing, 13)
    }
}

#Preview {
    ProductListItemView(product: Product(id: UUID(), imagePath: "food-1", rating: 4.1, reviewCount: 1001, name: "hello world привет мир михао гамарджоба", kgPrice: 25, previousPrice: 13, productOrigin: "Франция 🇫🇷", badge: "Свежий носок", discount: 90), selectedProductInfo: nil)
}
