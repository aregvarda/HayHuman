//
//  ChurchesList.swift
//  HayHuman
//
//  Created by Геворг on 07.01.2022.
//

import SwiftUI
import MapKit

struct ChurchesList: View {
    @StateObject private var vm = ChurchLocationsViewModel()
    var body: some View{
        ChurchLocationsView()
            .environmentObject(vm)
    }
}

struct ChurchesList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChurchesList()
        }
    }
}

//struct ChurchesMapView: UIViewRepresentable {
//
//}
