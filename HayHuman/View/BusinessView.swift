//
//  BusinessView.swift
//  HayHuman
//
//  Created by Геворг on 23.12.2021.
//

import SwiftUI
import MapKit


struct BusinessView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessView()
    }
}

struct BusinessView: View {
    var body: some View {
        ScrollView {
            HStack(spacing: 16) {
                LazyVGrid(columns: gridLayout, spacing: 25) {
                    ForEach(Array(businessCards.enumerated()), id: \.element) { offset, cardbus in
                        BusinessCardView(cardbus: cardbus)
                            .frame(height: 180)
                            .cornerRadius(15)
                    }
                }
            }.padding()
        }.navigationBarTitle("Business")
            .navigationBarItems(leading: Button {
                
            } label: {
                Image(systemName: "arrow.backward")
            }, trailing: Button {
            } label: {
                Image(systemName: "magnifyingglass")
            })
    }
}

struct CardBusiness: Hashable, Identifiable {
    static func == (lhs: CardBusiness, rhs: CardBusiness) -> Bool {
        return lhs.imageName == rhs.imageName && lhs.title == rhs.title
    }
    func hash(into hasher: inout Hasher) {
            hasher.combine(imageName)
            hasher.combine(title)
        }
    
    var id = UUID()
    let title: String
    let imageName: String
    var name: String
    var city: String
    var titleDetail: String
    var description: String
    let coordinates: CLLocationCoordinate2D
}

let businessCards: [CardBusiness] = [
    CardBusiness(title: "gulbenkian",
          imageName: "gulbenkian", name: "Calouste Gulbenkian", city: "Scutari, Constantinople, Ottoman Empire", titleDetail: "A British-Armenian businessman and philanthropist.", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
    CardBusiness(title: "libmann",
          imageName: "libmann", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
    CardBusiness(title: "manukyan",
          imageName: "manukyan", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
    CardBusiness(title: "ernekyan",
          imageName: "ernekyan", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
    CardBusiness(title: "kerkorian",
          imageName: "kerkorian", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
    CardBusiness(title: "vardanian",
          imageName: "vardanian", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
    CardBusiness(title: "afeyan",
          imageName: "afeyan", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
    CardBusiness(title: "hovnanian",
          imageName: "hovnanian", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
    CardBusiness(title: "mantashev",
          imageName: "mantashev", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
    CardBusiness(title: "сafesjian",
          imageName: "сafesjian", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
    CardBusiness(title: "sir paul",
          imageName: "sir_paul", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
    CardBusiness(title: "aramyants",
          imageName: "aramyants", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
    CardBusiness(title: "karapetyan",
          imageName: "karapetyan", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
    CardBusiness(title: "sirmakes",
          imageName: "sirmakes", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
    CardBusiness(title: "tchuruk",
          imageName: "tchuruk", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
    CardBusiness(title: "manoukian",
          imageName: "manoukian", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922))
]

struct BusinessCardView: View {
    let cardbus: CardBusiness
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image(cardbus.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: proxy.size.width,
                        height: proxy.size.height
                    )
                    .clipped()
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).fill(Color(.gray).opacity(0.4)))
                Text(cardbus.title.uppercased())
                    .font(.title3)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(7)
                    .foregroundColor(.white)
            }
        }
    }
}

