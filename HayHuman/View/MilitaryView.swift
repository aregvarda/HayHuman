//
//  MilitaryView.swift
//  HayHuman
//
//  Created by Геворг on 23.12.2021.
//

import SwiftUI
import CoreLocation

struct MilitaryView_Previews: PreviewProvider {
    static var previews: some View {
        MilitaryView()
    }
}
struct MilitaryView: View {
    @EnvironmentObject var militaryDetail: MilitaryDetail
    
    var body: some View {
        if militaryDetail.showingMilitaryProfile == false && militaryDetail.selectedMilitaryProfile == nil {
            ScrollView {
                LazyVGrid(columns: gridLayout, spacing: 25) {
                    ForEach(cardMilitary) { cardmil in
                        VStack {
                            MilitaryCardView(cardmil: cardmil)
                                .onTapGesture {
                                    withAnimation(.easeOut(duration: 0.1)) {
                                        feedback.impactOccurred()
                                    }
                                    militaryDetail.selectedMilitaryProfile = cardmil
                                    militaryDetail.showingMilitaryProfile = true
                                }
                            
                        }
                        .frame(height: 180)
                        .cornerRadius(15)
                    }
                }
                .padding()
                
            }
            .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                     Text("Military")
                     .fontWeight(.bold)
                     .font(.title)
                     
                  })})
        } else {
            MilitaryDetailList(cardMilitary: cardMilitary[0])
            
        }
        
    }
}

struct CardMilitary: Hashable, Codable, Identifiable {
    
    var id: Int
    let title: String
    let imageName: String
    fileprivate var coordinates: PoliticsCoordinates
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

struct MilitaryCoordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

let cardMilitary: [CardMilitary] = Bundle.main.decode("military.json")
let militaryCards: CardMilitary = cardMilitary[0]

struct MilitaryCardView: View {
    let cardmil: CardMilitary
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                Image(cardmil.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: proxy.size.width,
                        height: proxy.size.height
                    )
                    .clipped()
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).fill(Color(.gray).opacity(0.4)))
                Text(cardmil.title.uppercased())
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

