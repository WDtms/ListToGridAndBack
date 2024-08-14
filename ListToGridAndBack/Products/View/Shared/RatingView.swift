//
//  RatingView.swift
//  ListToGridAndBack
//
//  Created by Aleksey Shepelev on 14.08.2024.
//

import SwiftUI

struct RatingView: View {
    let rating: Double
    let reviewCount: Int?
    
    var body: some View {
        HStack {
            Image(AppIcons.star)
                .resizable()
                .frame(width: 12, height: 12)
            
            Spacer()
                .frame(width: 2)
            
            Text(DoubleUtils.getDoubleWithOneSymbolAfterDivider(double: rating))
                .iosCaption1()
            
            if let reviewCount = reviewCount {
                Divider()
                    .frame(height: 16)
                    .background(AppColors.textIcons1)
                
                Text("\(reviewCount) отзывов")
                    .iosCaption1()
                    .foregroundStyle(AppColors.textIcons1)
            }
        }
    }
}

#Preview {
    RatingView(rating: 4.1, reviewCount: 213)
}
