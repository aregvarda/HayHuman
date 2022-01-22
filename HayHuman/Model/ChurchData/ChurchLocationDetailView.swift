//
//  ChurchLocationDetailView.swift
//  HayHuman
//
//  Created by Геворг on 09.01.2022.
//

import SwiftUI
import MapKit

struct ChurchLocationDetailView: View {
    
    @ScaledMetric var size: CGFloat = 1
    @EnvironmentObject private var vm: ChurchLocationsViewModel
    let location: ChurchesLocations
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton, alignment: .topLeading)
    }
}

struct ChurchLocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChurchLocationDetailView(location: ChurchLocationsDataService.locations.first!)
            .environmentObject(ChurchLocationsViewModel())
    }
}

extension ChurchLocationDetailView {
    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .foregroundColor(.black)
//                .font(.largeTitle)
                .font(.system(size: 32 + size))
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
            Text(location.cityName)
//                .font(.title3)
                .font(.system(size: 20 + size))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
        }
    }
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
            
            if let url = URL(string: location.link) {
                Link("Read more on Wikipedia", destination: url)
                    .font(.headline)
                    .tint(.blue)
                    .multilineTextAlignment(.leading)
            }
        }
    }
    private var mapLayer: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: location.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))),
            annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
                Image("churchPin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .font(.headline)
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
            }
        }
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(30)
    }
    private var backButton: some View {
        Button {
            vm.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
}
