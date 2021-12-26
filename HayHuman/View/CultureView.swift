//
//  CultureView.swift
//  HayHuman
//
//  Created by Геворг on 26.12.2021.
//

import SwiftUI

struct CultureView_Previews: PreviewProvider {
    static var previews: some View {
        CultureView()
    }
}

struct CultureView: View {
    var body: some View {
        ScrollView {
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 25) {
                    ForEach(Array(leftCards.enumerated()), id: \.element) { offset, card in
                        CultureCardView(card: card)
                            .frame(height: 180)
                            .cornerRadius(15)
                    }
                }
                VStack(alignment: .leading, spacing: 25) {
                    ForEach(Array(rightCards.enumerated()), id: \.element) { offset, card in
                        CultureCardView(card: card)
                            .frame(height: 180)
                            .cornerRadius(15)
                    }
                }
            }.padding()
        }.navigationBarTitle("Culture")
            .navigationBarItems(leading: Button {
                
            } label: {
                Image(systemName: "arrow.backward")
            }, trailing: Button {
            } label: {
                Image(systemName: "magnifyingglass")
            })
    }
}

struct CultureCard: Hashable, Codable {
    let title: String
    let imageName: String
}

let leftCards: [CultureCard] = [
    .init(title: "Khachaturian",
          imageName: "khachaturyan"),
    .init(title: "Komitas",
          imageName: "komitas"),
    .init(title: "Raffi",
          imageName: "raffi"),
    .init(title: "Sarian",
          imageName: "sarian"),
    .init(title: "Teryan",
          imageName: "teryan"),
    .init(title: "Charents",
          imageName: "charents"),
    .init(title: "Isahakyan",
          imageName: "isahakyan"),
    .init(title: "Sevak",
          imageName: "sevak")
]

let rightCards: [CultureCard] = [
    .init(title: "Tumanian",
          imageName: "tumanian"),
    .init(title: "Vakhtangov",
          imageName: "vakhtangov"),
    .init(title: "Saroyan",
          imageName: "saroian"),
    .init(title: "Abovian",
          imageName: "abovian"),
    .init(title: "Kaputikyan",
          imageName: "kaputikyan"),
    .init(title: "Tsaturyan",
          imageName: "tsaturyan"),
    .init(title: "Sahyan",
          imageName: "sahyan"),
    .init(title: "Adamov",
          imageName: "adamov")
]

struct CultureCardView: View {
    let card: CultureCard
    var body: some View {
        GeometryReader { proxy in
            ZStack {
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
            }
        }
    }
}


