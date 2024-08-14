//
//  ProductHelpButtonsView.swift
//  ListToGridAndBack
//
//  Created by Aleksey Shepelev on 14.08.2024.
//

import SwiftUI

struct ProductHelpButtonsView: View {
    var body: some View {
        VStack(spacing: 0.0) {
            buttonBody(imagePath: AppIcons.bill) {
                
            }
            
            buttonBody(imagePath: AppIcons.favourite) {
                
            }
        }
        .background(Color.white.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    @ViewBuilder
    private func buttonBody(imagePath: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            Image(imagePath)
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                .padding(.all, 8)
        }

    }
}

#Preview {
    ProductHelpButtonsView()
}
