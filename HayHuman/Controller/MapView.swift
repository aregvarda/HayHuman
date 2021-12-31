//
//  MapView.swift
//  HayHuman
//
//  Created by Геворг on 26.12.2021.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: cardBusiness[0].locationCoordinate)
    }
}
