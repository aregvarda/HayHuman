//
//  CultureView.swift
//  HayHuman
//
//  Created by Геворг on 26.12.2021.
//

import SwiftUI
import CoreLocation

struct CultureView_Previews: PreviewProvider {
    static var previews: some View {
        CultureView()
            .environmentObject(CultureDetail())
    }
}

struct CultureView: View {
    
    @EnvironmentObject var cultureDetail: CultureDetail
    
    var body: some View {
        if cultureDetail.showingCultureProfile == false && cultureDetail.selectedCultureProfile == nil {
            ScrollView {
                LazyVGrid(columns: gridLayout, spacing: 25) {
                    ForEach(cardCulture) { card in
                        VStack {
                            CultureCardView(card: card)
                                .onTapGesture {
                                    withAnimation(.easeOut(duration: 0.1)) {
                                        feedback.impactOccurred()
                                    }
                                    cultureDetail.selectedCultureProfile = card
                                    cultureDetail.showingCultureProfile = true
                                }
                            
                        }
                        .frame(height: 180)
                        .cornerRadius(15)
                    }
                }
                .padding()
                
            }
        } else {
            CultureDetailList(cardCulture: cardCulture[0])
            
        }
        
    }
}

struct CultureCard: Hashable, Codable, Identifiable {
    
    var id: Int
    let title: String
    let imageName: String
    fileprivate var coordinates: CultureCoordinates
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

struct CultureCoordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

let cardCulture: [CultureCard] = Bundle.main.decode("culture.json")
let cultureCards: CultureCard = cardCulture[0]

struct CultureCardView: View {
    let card: CultureCard
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                Image(card.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: proxy.size.width,
                        height: proxy.size.height
                    )
                    .clipped()
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).fill(Color(.gray).opacity(0.4)))
                Text(card.title.uppercased())
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


