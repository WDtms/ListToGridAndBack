//
//  SelectedProductInfo.swift
//  ListToGridAndBack
//
//  Created by Aleksey Shepelev on 13.08.2024.
//

import Foundation

struct SelectedProductInfo {
    static let countBareMinimum: Double = 0.1
    
    let id: UUID
    var productPrice: Double
    var totalPrice: Double
    var totalCount: Double
    var countedBy: CountedBy
    
    enum CountedBy {
        case piece
        case kg
        
        var minimum: Double {
            switch self {
            case .kg:
                SelectedProductInfo.countBareMinimum
            case .piece:
                1.0
            }
        }
    }
}
