//
//  ScienceView.swift
//  HayHuman
//
//  Created by Геворг on 23.12.2021.
//

import SwiftUI

struct ScienceView_Previews: PreviewProvider {
    static var previews: some View {
        ScienceView()
    }
}

struct ScienceView: View {
    var body: some View {
        ScrollView {
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 25) {
                    ForEach(Array(leftScienceCards.enumerated()), id: \.element) { offset, cardsci in
                        ScienceCardView(cardsci: cardsci)
                            .frame(height: 180)
                            .cornerRadius(15)
                    }
                }
                VStack(alignment: .leading, spacing: 25) {
                    ForEach(Array(rightScienceCards.enumerated()), id: \.element) { offset, cardsci in
                        ScienceCardView(cardsci: cardsci)
                            .frame(height: 180)
                            .cornerRadius(15)
                    }
                }
            }.padding()
        }.navigationBarTitle("Science")
            .navigationBarItems(leading: Button {
                
            } label: {
                Image(systemName: "arrow.backward")
            }, trailing: Button {
            } label: {
                Image(systemName: "magnifyingglass")
            })
    }
}

struct CardScience: Hashable {
    let title: String
    let imageName: String
}

let leftScienceCards: [CardScience] = [
    .init(title: "orbeli",
          imageName: "orbeli"),
    .init(title: "ambartsumian",
          imageName: "ambartsumian"),
    .init(title: "artin",
          imageName: "artin"),
    .init(title: "iosifyan",
          imageName: "iosifyan"),
    .init(title: "damadian",
          imageName: "damadian"),
    .init(title: "ter-poghosyan",
          imageName: "ter-poghosyan"),
    .init(title: "rafaelants",
          imageName: "rafaelants"),
    .init(title: "gazandyan",
          imageName: "gazandyan")
]

let rightScienceCards: [CardScience] = [
    .init(title: "mikoyan",
          imageName: "mikoyan"),
    .init(title: "alikhanian",
          imageName: "alikhanian"),
    .init(title: "oganessian",
          imageName: "oganessian"),
    .init(title: "adamian",
          imageName: "adamian"),
    .init(title: "babayan",
          imageName: "babayan"),
    .init(title: "sisakian",
          imageName: "sisakian"),
    .init(title: "bagian",
          imageName: "bagian"),
    .init(title: "baroian",
          imageName: "baroian")
]

struct ScienceCardView: View {
    let cardsci: CardScience
    var body: some View {
        GeometryReader { proxy in
            ZStack {
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
            }
        }
    }
}

