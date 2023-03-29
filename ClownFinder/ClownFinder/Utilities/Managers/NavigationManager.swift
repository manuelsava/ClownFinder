//
//  NavigationManager.swift
//  ClownFinder
//
//  Created by Manuel Savà on 29/03/23.
//

import SwiftUI

final class NavigationManager: ObservableObject {
    static let shared = NavigationManager()
    
    @Published var selectedTab: Int = 0
}
