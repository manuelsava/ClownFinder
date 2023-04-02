//
//  ClownFavouritesView.swift
//  ClownFinder
//
//  Created by Manuel Savà on 31/03/23.
//

import SwiftUI

struct ClownFavouritesView: View {
    
    @Environment(\.managedObjectContext) var manager
    @FetchRequest(sortDescriptors: []) var favClowns: FetchedResults<FavClown>
    @StateObject var viewModel = ClownFavouritesViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack{
                List {
                    ForEach(favClowns) { clown in
                        if clown.isFault {
                            EmptyView()
                        } else {
                            let clownInstance = viewModel.toClownInstance(favClown: clown)
                            ClownListItemView(clown: clownInstance)
                            .swipeActions {
                                Button(role: .destructive) {
                                    let index = favClowns.firstIndex { $0.id == Int16(clown.id) }
                                    manager.delete(favClowns[index!])
                            
                                    try? manager.save()
                                } label: {
                                     Image(systemName: "trash")
                                        .resizable()
                                        .scaledToFit()
                                }
                                .tint(.red)
                            }
                        }
                    }
                }
                .navigationTitle("Favourites ⭐️")
            }
        }
    }
}

struct ClownFavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        ClownFavouritesView()
            .preferredColorScheme(.dark)
    }
}
