//
//  MapAnnotationView.swift
//  ClownFinder
//
//  Created by Manuel Savà on 25/03/23.
//

import SwiftUI

struct MapAnnotationView: View {
    var clown: Clown
    @State private var animation: Double = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 50, height: 50)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 50, height: 50, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(clown.imageName)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 50, height: 50)
        }
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView(clown: MockClown.manuClown)
    }
}
