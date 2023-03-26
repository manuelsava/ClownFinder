//
//  LoadingView.swift
//  ClownFinder
//
//  Created by Manuel Savà on 25/03/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(1.5)
                .tint(.accentColor)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
