//
//  MapView.swift
//  ClownFinder
//
//  Created by Manuel Savà on 25/03/23.
//

import SwiftUI
import MapKit

struct MapView: View {

    @StateObject var viewModel = MapViewModel()
    @EnvironmentObject var clowns: Clowns
    @State var selectedClown: Clown? = nil
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinate = CLLocationCoordinate2D(latitude: 45.60678, longitude: 9.23146)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 0.0085, longitudeDelta: 0.0085)
        var mapRegion = MKCoordinateRegion(center: mapCoordinate, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: clowns.items) { clown in
            MapAnnotation(coordinate: clown.coordinate) {
                MapAnnotationView(clown: clown)
                    .onTapGesture {
                        viewModel.isShowingDetailView = true
                        selectedClown = clown
                    }
            }
        }
        .edgesIgnoringSafeArea(.all)
        
        .sheet(isPresented: $viewModel.isShowingDetailView) {
            ClownDetailView(isShowingDetailView: $viewModel.isShowingDetailView, clown: selectedClown!)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let clownService = ClownService()
        clownService.clowns.items = localClowns().clowns
        
        return MapView()
            .environmentObject(clownService.clowns)
    }
}
