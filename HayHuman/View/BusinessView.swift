//
//  BusinessView.swift
//  HayHuman
//
//  Created by Геворг on 23.12.2021.
//

import SwiftUI
import CoreLocation



struct BusinessView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessView()
            .environmentObject(BusinessDetail())
    }
}

struct BusinessView: View {
    
    @EnvironmentObject var businessDetail: BusinessDetail
    
    
    var body: some View {
            if businessDetail.showingBusinessProfile == false && businessDetail.selectedBusinessProfile == nil {
                ScrollView {
                LazyVGrid(columns: gridLayout, spacing: 25) {
                    ForEach(cardBusiness) { cardbus in
                        VStack {
                            BusinessCardView(cardbus: cardbus)
                                .onTapGesture {
                                    withAnimation(.easeOut(duration: 0.1)) {
                                        feedback.impactOccurred()
                                    }
                                    businessDetail.selectedBusinessProfile = cardbus
                                    businessDetail.showingBusinessProfile = true
                                }
                            
                        }
                        .frame(height: 180)
                        .cornerRadius(15)
                    }
                }
                .padding()
                
            }
            } else {
                BusinessDetailList(cardBusiness: cardBusiness[0])
                
            }
        
    }
}


struct CardBusiness: Hashable, Codable, Identifiable {
    
    var id: Int
    let title: String
    let imageName: String
    fileprivate var coordinates: BusinessCoordinates
    var name: String
    var city: String
    var titleDetail: String
    var description: String
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}

struct BusinessCoordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

let cardBusiness: [CardBusiness] = Bundle.main.decode("business.json")
let businessCards: CardBusiness = cardBusiness[0]


struct BusinessCardView: View {
    let cardbus: CardBusiness
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
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
                    .shadow(color: .gray, radius: 4, x: 0, y: 0)
            }
        }
    }
}

