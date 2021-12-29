//
//  ProfileDetail.swift
//  HayHuman
//
//  Created by Геворг on 26.12.2021.
//

import Foundation
import SwiftUI
import CoreLocation

struct BusinessProfileDetail: Hashable, Codable {

    var id = UUID()
    var name: String
    var city: String
    var title: String
    var description: String
    var latitude: Double
    var longitude: Double

    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}


