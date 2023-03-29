//
//  ClownListView.swift
//  ClownFinder
//
//  Created by Manuel Savà on 25/03/23.
//

import SwiftUI

struct ClownListView: View {
    
    @EnvironmentObject var clownService: ClownService
    @Binding var isListView: Bool
    
    var body: some View {
        ZStack {
            NavigationStack{
                List {
                    ForEach(clownService.clowns.items) { clown in
                        NavigationLink(destination: ClownDetailView(isShowingDetailView: .constant(false), clown: clown)) {
                            ClownListItemView(clown: clown)
                        }
                    }
                }
                .navigationTitle("Clowns 🤡")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Button() {
                            clownService.clowns.items.shuffle()
                        } label: {
                            Image(systemName: "shuffle")
                        }
                    })
                })
            }
        }
    }
}

struct ClownListView_Previews: PreviewProvider {
    
    static var previews: some View {
        let clownService = ClownService()
        clownService.clowns.items = localClowns().clowns
        
        return ClownListView(isListView: .constant(false))
            .environmentObject(clownService.clowns)
            .preferredColorScheme(.dark)
    }
}

struct ClownListItemView: View {
    let clown: Clown
    
    var body: some View {
        HStack {
            Image(clown.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            
            VStack (alignment: .leading, spacing: 5){
                Text(clown.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text(clown.shortDescription)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            }
            .padding(.leading)
        }
    }
}
