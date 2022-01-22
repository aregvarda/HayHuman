//
//  MapView.swift
//  HayHuman
//
//  Created by Геворг on 26.12.2021.
//

import SwiftUI
import MapKit

struct BusinessMapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}


struct BusinessMapView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessMapView(coordinate: cardBusiness[0].locationCoordinate)
    }
}
