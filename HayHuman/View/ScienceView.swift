//
//  ScienceView.swift
//  HayHuman
//
//  Created by Геворг on 23.12.2021.
//

import SwiftUI
import CoreLocation

struct ScienceView_Previews: PreviewProvider {
    static var previews: some View {
        ScienceView()
    }
}

struct ScienceView: View {
    @EnvironmentObject var scienceDetail: ScienceDetail

    var body: some View {
        if scienceDetail.showingScienceProfile == false && scienceDetail.selectedScienceProfile == nil {
            ScrollView {
                LazyVGrid(columns: gridLayout, spacing: 25) {
                    ForEach(cardScience) { cardsci in
                        VStack {
                            ScienceCardView(cardsci: cardsci)
                                .onTapGesture {
                                    withAnimation(.easeOut(duration: 0.1)) {
                                        feedback.impactOccurred()
                                    }
                                    scienceDetail.selectedScienceProfile = cardsci
                                    scienceDetail.showingScienceProfile = true
                                }
                            
                        }
                        .frame(height: 180)
                        .cornerRadius(15)
                    }
                }
                .padding()
                
            }
        } else {
            ScienceDetailList(cardScience: cardScience[0])
            
        }
        
    }
}

struct CardScience: Hashable, Codable, Identifiable {
    
    var id: Int
    let title: String
    let imageName: String
    fileprivate var coordinates: ScienceCoordinates
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

struct ScienceCoordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

let cardScience: [CardScience] = Bundle.main.decode("science.json")
let scienceCards: CardScience = cardScience[0]


struct ScienceCardView: View {
    let cardsci: CardScience
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                Image(cardsci.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: proxy.size.width,
                        height: proxy.size.height
                    )
                    .clipped()
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).fill(Color(.gray).opacity(0.4)))
                Text(cardsci.title.uppercased())
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

