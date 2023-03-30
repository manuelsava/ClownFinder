//
//  ClownDetailView.swift
//  ClownFinder
//
//  Created by Manuel Savà on 25/03/23.
//

import SwiftUI

struct ClownDetailView: View {
    
    @Environment(\.openURL) var openURL
    @Binding var isShowingDetailView: Bool
    @EnvironmentObject var navigationManager: NavigationManager
    @EnvironmentObject var clownService: ClownService
    @Environment(\.presentationMode) var presentationMode
    
    let clown: Clown
    
    var body: some View {
        NavigationStack {
            VStack() {
                Image(clown.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .padding(.top, 30)
                
                Divider()
                    .frame(width: 100)
                    .padding(.top)
                    .padding(.bottom)
                
                Text(clown.extendedDescription)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .lineLimit(5)
                    .padding(.leading)
                    .padding(.trailing)
                
                Spacer()
                
                if !isShowingDetailView {
                    Button {
                        //map
                        //self.presentationMode.wrappedValue.dismiss()
                        clownService.selectedClown = clown
                        navigationManager.selectedTab = 1
                    } label: {
                        ActionButton(label: "Trova sulla mappa")
                    }
                    .buttonStyle(.bordered)
                    .tint(.accentColor)
                    .padding(.bottom)
                } else {
                    Button {
                        openURL(URL(string: "http://www.google.com/maps/place/\(clownService.selectedClown!.latitude),\(clownService.selectedClown!.longitude)")!)
                    } label: {
                        ActionButton(label: "Naviga")
                    }
                    .buttonStyle(.bordered)
                    .tint(.accentColor)
                    .padding(.bottom)
                }
                
                Spacer()
            }
            
            .toolbar {
                if isShowingDetailView {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            isShowingDetailView = false
                        } label: {
                            Text("Chiudi")
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Link("Segui", destination: URL(string: clown.instagram)!)
                }
            }
        }
    }
}

struct ClownDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ClownDetailView(isShowingDetailView: .constant(false), clown: MockClown.manuClown)
            .preferredColorScheme(.dark)
    }
}

struct ActionButton: View {

    let label: String
    
    var body: some View {
        Text(label)
            .fontWeight(.semibold)
            .frame(width: 250, height: 50)
    }
}
