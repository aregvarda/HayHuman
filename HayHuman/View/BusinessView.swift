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
    }
}

struct BusinessView: View {
    var body: some View {
        ScrollView {
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 25) {
                    ForEach(Array(leftBusinessCards.enumerated()), id: \.element) { offset, cardbus in
                        BusinessCardView(cardbus: cardbus)
                            .frame(height: 180)
                            .cornerRadius(15)
                    }
                }
                VStack(alignment: .leading, spacing: 25) {
                    ForEach(Array(rightBusinessCards.enumerated()), id: \.element) { offset, cardbus in
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

struct CardBusiness: Hashable {
    let title: String
    let imageName: String
}

let leftBusinessCards: [CardBusiness] = [
    .init(title: "gulbenkian",
          imageName: "gulbenkian"),
    .init(title: "libmann",
          imageName: "libmann"),
    .init(title: "manukyan",
          imageName: "manukyan"),
    .init(title: "ernekyan",
          imageName: "ernekyan"),
    .init(title: "kerkorian",
          imageName: "kerkorian"),
    .init(title: "vardanian",
          imageName: "vardanian"),
    .init(title: "afeyan",
          imageName: "afeyan"),
    .init(title: "hovnanian",
          imageName: "hovnanian")
]

let rightBusinessCards: [CardBusiness] = [
    .init(title: "mantashev",
          imageName: "mantashev"),
    .init(title: "сafesjian",
          imageName: "сafesjian"),
    .init(title: "sir paul",
          imageName: "sir_paul"),
    .init(title: "aramyants",
          imageName: "aramyants"),
    .init(title: "karapetyan",
          imageName: "karapetyan"),
    .init(title: "sirmakes",
          imageName: "sirmakes"),
    .init(title: "tchuruk",
          imageName: "tchuruk"),
    .init(title: "manoukian",
          imageName: "manoukian")
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

