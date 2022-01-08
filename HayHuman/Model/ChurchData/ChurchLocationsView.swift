//
//  LocationsView.swift
//  HayHuman
//
//  Created by Геворг on 08.01.2022.
//

import SwiftUI
import MapKit

struct ChurchLocationsView: View {
    @EnvironmentObject private var vm: ChurchLocationsViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()
                
                ZStack {
                    ForEach(vm.locations) { location in
                        if vm.mapLocation == location {
                            ChurchLocationPreviewView(location: location)
                                .shadow(color: Color.black.opacity(0.3), radius: 20)
                                .padding()
                                .transition(.asymmetric(
                                    insertion: .move(edge: .trailing),
                                    removal: .move(edge: .leading)))
                        }
                    }
                }
            }
        }
    }
}

struct ChurchLocationsView_Previews: PreviewProvider {
    static var previews: some View {
        ChurchLocationsView()
            .environmentObject(ChurchLocationsViewModel())
    }
}

extension ChurchLocationsView {
    private var header: some View {
        VStack {
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
            }
            
            if vm.showLocationsList {
                ChurchLocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}
