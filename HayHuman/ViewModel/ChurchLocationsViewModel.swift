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
    
    @Published var sheetLocation: ChurchesLocations? = nil
    
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
    
    func nextButtonPressed() {
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("Could not find current index in locations array! Should never happen.")
            return
        }
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
        
    }
}
