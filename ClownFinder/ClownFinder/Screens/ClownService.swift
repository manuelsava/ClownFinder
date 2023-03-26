//
//  ClownListViewModel.swift
//  ClownFinder
//
//  Created by Manuel Savà on 25/03/23.
//

import SwiftUI

@MainActor final class ClownService: ObservableObject {
    
    @Published var clowns = Clowns()
    @Published var selectedClown: Clown? = nil
    @Published var isLoading: Bool = false
    
    init() {}
    
    func getClowns() {
        var items: [Clown] = []
        isLoading = true
        
        Task {
            do {
                items = try await NetworkManager.shared.getClowns()
                clowns.items = items
                isLoading = false
            } catch {
                print("No API Found")
                items = localClowns().clowns
                clowns.items = items
                isLoading = false
            }
        }
    }
}
