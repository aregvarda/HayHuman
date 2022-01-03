//
//  PoliticsView.swift
//  HayHuman
//
//  Created by Геворг on 23.12.2021.
//

import SwiftUI
import CoreLocation

struct PoliticsView_Previews: PreviewProvider {
    static var previews: some View {
        PoliticsView()
    }
}

struct PoliticsView: View {
    
    @EnvironmentObject var politicsDetail: PoliticsDetail
    
    var body: some View {
        ScrollView {
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 25) {
                    ForEach(Array(leftPoliticsCards.enumerated()), id: \.element) { offset, cardpol in
                        PoliticsCardView(cardpol: cardpol)
                            .frame(height: 180)
                            .cornerRadius(15)
                    }
                }
                VStack(alignment: .leading, spacing: 25) {
                    ForEach(Array(rightPoliticsCards.enumerated()), id: \.element) { offset, cardpol in
                        PoliticsCardView(cardpol: cardpol)
                            .frame(height: 180)
                            .cornerRadius(15)
                    }
                }
            }.padding()
        }.navigationBarTitle("Politics")
            .navigationBarItems(leading: Button {
                
            } label: {
                Image(systemName: "arrow.backward")
            }, trailing: Button {
            } label: {
                Image(systemName: "magnifyingglass")
            })
    }
}

struct CardPolitics: Hashable {
    let title: String
    let imageName: String
}

let leftPoliticsCards: [CardPolitics] = [
    .init(title: "loris-melikov",
          imageName: "loris-melikov"),
    .init(title: "balladur",
          imageName: "balladur"),
    .init(title: "nubar",
          imageName: "nubar"),
    .init(title: "shaumian",
          imageName: "shaumian"),
    .init(title: "avanesov",
          imageName: "avanesov"),
    .init(title: "deukmejian",
          imageName: "deukmejian"),
    .init(title: "al-hafez",
          imageName: "al-hafez"),
    .init(title: "devedjian",
          imageName: "devedjian")
]

let rightPoliticsCards: [CardPolitics] = [
    .init(title: "noradunkyan",
          imageName: "noradunkyan"),
    .init(title: "delyanov",
          imageName: "delyanov"),
    .init(title: "mikoyan",
          imageName: "amikoyan"),
    .init(title: "darzi",
          imageName: "darzi"),
    .init(title: "mardian",
          imageName: "mardian"),
    .init(title: "derounian",
          imageName: "derounian"),
    .init(title: "menem",
          imageName: "menem"),
    .init(title: "sarkis",
          imageName: "sarkis")
]

struct PoliticsCardView: View {
    let cardpol: CardPolitics
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image(cardpol.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: proxy.size.width,
                        height: proxy.size.height
                    )
                    .clipped()
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).fill(Color(.gray).opacity(0.4)))
                Text(cardpol.title.uppercased())
                    .font(.title3)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(7)
                    .foregroundColor(.white)
            }
        }
    }
}


