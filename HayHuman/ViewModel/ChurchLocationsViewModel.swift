//
//  ChurchLocationsViewModel.swift
//  HayHuman
//
//  Created by Геворг on 08.01.2022.
//

import MapKit
import SwiftUI

class ChurchLocationsViewModel: ObservableObject {
    
    @Published var searchText: String = ""
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
        self.locations = ChurchLocationsDataService.locations
        // If locations.first fails, you can simply use some default
        let firstLocation = ChurchLocationsDataService.locations.first ?? ChurchesLocations(
            name: "Etchmiadzin Cathedral",
            cityName: "Etchmiadzin, Armenia",
            coordinates: CLLocationCoordinate2D(latitude: 40.161929370372455, longitude: 44.29111529751223),
            description: "Etchmiadzin Cathedral (Armenian: Էջմիածնի մայր տաճար) is the mother church of the Armenian Apostolic Church, located in the city of Vagharshapat (Etchmiadzin), Armenia. According to most scholars it was the first cathedral built in ancient Armenia, and is often considered the oldest cathedral in the world.",
            imageNames: [
                "echmiadzin_1",
                "echmiadzin_2",
                "echmiadzin_3",
            ],
            link: "https://en.wikipedia.org/wiki/Etchmiadzin_Cathedral")
        self.mapLocation = firstLocation
        self.updateMapRegion(location: firstLocation)
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
