//
//  ClownFinderApp.swift
//  ClownFinder
//
//  Created by Manuel Savà on 25/03/23.
//

import SwiftUI

@main
struct ClownFinderApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ClownFinderTabView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
