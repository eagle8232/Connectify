//
//  TabBarManager.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 14.07.23.
//

import SwiftUI


class TabBarManager: ObservableObject {
    @Published var isVisible: Bool = false
    
    init() {
        isVisible = true
    }
}
