//
//  ContentView.swift
//  ClownFinder
//
//  Created by Manuel Savà on 25/03/23.
//

import SwiftUI

struct ClownFinderTabView: View {
    
    @StateObject var navigationManager = NavigationManager()
    @StateObject var clownService = ClownService()
    @StateObject var viewModel = ClownTabViewModel()
    
    var body: some View {
        ZStack {
            TabView(selection: $navigationManager.selectedTab) {
                ClownListView(isListView: $viewModel.isListView)
                    .environmentObject(clownService)
                    .environmentObject(navigationManager)
                    .tabItem {
                        Label("Clowns", systemImage: "person.crop.square")
                    }
                    .tag(0)
                
                MapView()
                    .environmentObject(clownService)
                    .environmentObject(navigationManager)
                    .tabItem {
                        Label("Find", systemImage: "map")
                    }
                    .tag(1)
            }
            
            if clownService.isLoading {
                LoadingView()
            }
        }
        .task {
            clownService.getClowns()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ClownFinderTabView()
            .preferredColorScheme(.dark)
    }
}
