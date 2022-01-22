//
//  CultureMapView.swift
//  HayHuman
//
//  Created by Геворг on 03.01.2022.
//

import SwiftUI
import MapKit

struct CultureMapView: UIViewRepresentable {
    
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


struct CultureMapView_Previews: PreviewProvider {
    static var previews: some View {
        CultureMapView(coordinate: cardCulture[0].locationCoordinate)
    }
}
