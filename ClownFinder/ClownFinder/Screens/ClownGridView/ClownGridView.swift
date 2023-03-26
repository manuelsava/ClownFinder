//
//  ClownGridView.swift
//  ClownFinder
//
//  Created by Manuel Savà on 25/03/23.
//

import SwiftUI

struct ClownGridView: View {

    @EnvironmentObject var clowns: Clowns
    @Binding var isListView: Bool
    @State var selectedClown: Clown? = nil
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 30) {
                        ForEach(clowns.items) { clown in
                            ClownTitleView(clown: clown)
                                .onTapGesture {
                                    selectedClown = clown
                                    //viewModel.isShowingDetailView = true
                                }
                        }
                    }
                    .padding(.top)
                }
                .navigationTitle("Clowns 🤡")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Button() {
                            isListView = !isListView
                        } label: {
                            Image(systemName: "circle.grid.2x2")
                        }
                    })
                })
            }
        }
        .background(Color(.systemBackground))
        /*.sheet(isPresented: $viewModel.isShowingDetailView) {
            ClownDetailView(isShowingDetailView: $viewModel.isShowingDetailView, clown: selectedClown!)
        }*/
    }
}

struct ClownGridView_Previews: PreviewProvider {
    static var previews: some View {
        ClownGridView(isListView: .constant(false))
            .preferredColorScheme(.dark)
    }
}

struct ClownTitleView: View {
    
    let clown: Clown
    
    var body: some View {
        VStack {
            Image(clown.imageName)
                .resizable()
                .scaledToFit()
                .scaleEffect(1.8)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            Text(clown.name)
                .font(.body)
                .foregroundColor(.gray)
        }
    }
}
