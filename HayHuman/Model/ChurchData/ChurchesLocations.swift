//
//  ChurchesLocations.swift
//  HayHuman
//
//  Created by Геворг on 08.01.2022.
//

import Foundation
import MapKit

struct ChurchesLocations: Identifiable, Equatable {
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        name + cityName
    }
    
    //Equatable
    static func == (lhs: ChurchesLocations, rhs: ChurchesLocations) -> Bool {
        lhs.id == rhs.id
    }
}

