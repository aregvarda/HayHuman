//
//  ChurchLocationsListView.swift
//  HayHuman
//
//  Created by Геворг on 08.01.2022.
//

import SwiftUI

struct ChurchLocationsListView: View {
    
    @EnvironmentObject private var vm: ChurchLocationsViewModel
    @State var searchChurchText = ""
    @State var searchingChurch = false
    
    var body: some View {
        List {
            ChurchSearchBar(searchChurchText: $searchChurchText, searchingChurch: $searchingChurch)
                .toolbar {
                    if searchingChurch {
                        Button("Cancel") {
                            searchChurchText = ""
                            withAnimation {
                                searchingChurch = false
                                UIApplication.shared.dismissChurchKeyboard()
                            }
                        }
                    }
                }
                .gesture(DragGesture()
                            .onChanged({ _ in
                    UIApplication.shared.dismissChurchKeyboard()
                })
                )
                .padding(.bottom)
            ForEach(vm.locations.filter({ "\($0)".contains(searchChurchText) || searchChurchText.isEmpty})) { location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
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
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
