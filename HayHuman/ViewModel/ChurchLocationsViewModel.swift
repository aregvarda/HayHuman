//
//  ChurchLocationsViewModel.swift
//  HayHuman
//
//  Created by Геворг on 08.01.2022.
//

import MapKit
import Foundation
import SwiftUI

class ChurchLocationsViewModel: ObservableObject {
    @Published var locations: [ChurchesLocations]
    @Published var mapLocation: ChurchesLocations {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    //Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    //Show list of locations
    @Published var showLocationsList: Bool = false
    
    init() {
        let locations = ChurchLocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: ChurchesLocations) {
        withAnimation(.easeOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    
    }
    func showNextLocation(location: ChurchesLocations) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
}
