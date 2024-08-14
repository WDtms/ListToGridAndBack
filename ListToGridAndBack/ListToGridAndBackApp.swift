//
//  ListToGridAndBackApp.swift
//  ListToGridAndBack
//
//  Created by Aleksey Shepelev on 13.08.2024.
//

import SwiftUI

@main
struct ListToGridAndBackApp: App {
    var body: some Scene {
        WindowGroup {
            ProductsScreenView()
                .preferredColorScheme(.light)
        }
    }
}
