//
//  ClownFavouritesViewModel.swift
//  ClownFinder
//
//  Created by Manuel Savà on 31/03/23.
//

import SwiftUI

final class ClownFavouritesViewModel: ObservableObject {
    func toClownInstance(favClown: FavClown) -> Clown {
        let clown = Clown(id: Int(favClown.id), name: favClown.name!, shortDescription: favClown.shortDesc!, extendedDescription: "", latitude: 0.0, longitude: 0.0, imageName: favClown.imageName!, instagram: "")
        
        return clown
    }
}
