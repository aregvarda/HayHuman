//
//  MKCoordinateRegion.swift
//  HayHuman
//
//  Created by Геворг on 31.12.2021.
//

import MapKit
import SwiftUI

extension MKCoordinateRegion {

    static var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 22.495, longitude: 88.3247),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
}
