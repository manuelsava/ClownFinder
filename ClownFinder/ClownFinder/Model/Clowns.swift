//
//  Clowns.swift
//  ClownFinder
//
//  Created by Manuel Savà on 26/03/23.
//

import SwiftUI

class Clowns: ObservableObject {
    @Published var items = [Clown]()
    
    init() {
        items = []
    }
}
