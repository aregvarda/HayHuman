//
//  ProfileDetail.swift
//  HayHuman
//
//  Created by Геворг on 26.12.2021.
//

import Foundation
import SwiftUI
import CoreLocation

struct ProfileDetail: Hashable, Codable {

    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String

    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }


    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
