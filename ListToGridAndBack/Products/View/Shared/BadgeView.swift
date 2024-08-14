//
//  BadgeView.swift
//  ListToGridAndBack
//
//  Created by Aleksey Shepelev on 14.08.2024.
//

import SwiftUI

struct BadgeView: View {
    let badgeText: String
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 12)
            
            VStack {
                Spacer()
                    .frame(height: 2)
                
                Text(badgeText)
                    .sfPro10()
                    .foregroundColor(.white)
                
                Spacer()
                    .frame(height: 4)
            }
            
            Spacer()
                .frame(width: 6)
            
        }
        .background(AppColors.blueColor)
        .cornerRadius(6, corners: [.topLeft, .bottomRight, .topRight])

    }
}

fileprivate extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

fileprivate struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    BadgeView(badgeText: "Удар по нервам")
}
