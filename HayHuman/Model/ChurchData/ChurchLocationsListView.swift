//
//  ChurchLocationsListView.swift
//  HayHuman
//
//  Created by Геворг on 08.01.2022.
//

import SwiftUI

struct ChurchLocationsListView: View {
    
    @EnvironmentObject private var vm: ChurchLocationsViewModel
    @ScaledMetric var size: CGFloat = 1
    
    var body: some View {
        List {
            
            ForEach(vm.locations) { location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .foregroundColor(.black)
                .padding(.vertical, 4)
                .listRowBackground(Color(.clear))
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct ChurchLocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        ChurchLocationsListView()
            .environmentObject(ChurchLocationsViewModel())
    }
}

extension ChurchLocationsListView {
    
    private func listRowView(location: ChurchesLocations) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                    .font(.system(size: 13 + size))
                    .multilineTextAlignment(.leading)
                Text(location.cityName)
                    .font(.subheadline)
                    .font(.system(size: 10 + size))
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
}
