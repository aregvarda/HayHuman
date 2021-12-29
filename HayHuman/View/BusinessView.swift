//
//  BusinessView.swift
//  HayHuman
//
//  Created by Геворг on 23.12.2021.
//

import SwiftUI



struct BusinessView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessView()
            .environmentObject(BusinessDetail())
    }
}

struct BusinessView: View {
    
    @EnvironmentObject var businessDetail: BusinessDetail
    @Namespace var namespace
    @State var loadView = false
    
    var body: some View {
        ScrollView {
            if businessDetail.showingBusinessProfile == false && businessDetail.selectedBusinessProfile == nil {
                VStack {
                    HStack(spacing: 16) {
                        LazyVGrid(columns: gridLayout, spacing: 25) {
                            ForEach(cardBusiness) { cardbus in
                                BusinessCardView(cardbus: cardbus)
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            businessDetail.selectedBusinessProfile = cardbus
                                            businessDetail.showingBusinessProfile = true
                                            businessDetail.showingBusinessProfile.toggle()
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                                loadView.toggle()
                                            }
                                        }
                                    }
                                    .matchedGeometryEffect(id: cardbus.id, in: namespace)
                                    .frame(height: 180)
                                    .cornerRadius(15)
                            }
                        }
                    }.padding()
                }
            } else {
                BusinessDetailList()
            }
        }
    }
}

struct CardBusiness: Encodable, Decodable, Hashable, Identifiable {
    static func == (lhs: CardBusiness, rhs: CardBusiness) -> Bool {
        return lhs.imageName == rhs.imageName && lhs.title == rhs.title
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(imageName)
        hasher.combine(title)
    }
    
    var id: Int
    let title: String
    let imageName: String
    var name: String
    var city: String
    var titleDetail: String
    var description: String
}

let cardBusiness: [CardBusiness] = Bundle.main.decode("business.json")
let businessCards: CardBusiness = cardBusiness[1]
//    CardBusiness(title: "gulbenkian",
//                 imageName: "gulbenkian", name: "Calouste Gulbenkian", city: "Constantinople, Ottoman Empire", titleDetail: "A British-Armenian businessman and philanthropist.", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
//    CardBusiness(title: "libmann",
//                 imageName: "libmann", name: "test1", city: "test1", titleDetail: "test1", description: "test1", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
//    CardBusiness(title: "manukyan",
//                 imageName: "manukyan", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
//    CardBusiness(title: "ernekyan",
//                 imageName: "ernekyan", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
//    CardBusiness(title: "kerkorian",
//                 imageName: "kerkorian", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
//    CardBusiness(title: "vardanian",
//                 imageName: "vardanian", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
//    CardBusiness(title: "afeyan",
//                 imageName: "afeyan", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
//    CardBusiness(title: "hovnanian",
//                 imageName: "hovnanian", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
//    CardBusiness(title: "mantashev",
//                 imageName: "mantashev", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
//    CardBusiness(title: "сafesjian",
//                 imageName: "сafesjian", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
//    CardBusiness(title: "sir paul",
//                 imageName: "sir_paul", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
//    CardBusiness(title: "aramyants",
//                 imageName: "aramyants", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
//    CardBusiness(title: "karapetyan",
//                 imageName: "karapetyan", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
//    CardBusiness(title: "sirmakes",
//                 imageName: "sirmakes", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
//    CardBusiness(title: "tchuruk",
//                 imageName: "tchuruk", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
//    CardBusiness(title: "manoukian",
//                 imageName: "manoukian", name: "test", city: "test", titleDetail: "test", description: "test", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922))
//]

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

