//
//  MilitaryView.swift
//  HayHuman
//
//  Created by Геворг on 23.12.2021.
//

import SwiftUI

struct MilitaryView_Previews: PreviewProvider {
    static var previews: some View {
        MilitaryView()
    }
}
struct MilitaryView: View {
    var body: some View {
        ScrollView {
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 25) {
                    ForEach(Array(leftMilitaryCards.enumerated()), id: \.element) { offset, cardmil in
                        MilitaryCardView(cardmil: cardmil)
                            .frame(height: 180)
                            .cornerRadius(15)
                    }
                }
                VStack(alignment: .leading, spacing: 25) {
                    ForEach(Array(rightMilitaryCards.enumerated()), id: \.element) { offset, cardmil in
                        MilitaryCardView(cardmil: cardmil)
                            .frame(height: 180)
                            .cornerRadius(15)
                    }
                }
            }.padding()
        }.navigationBarTitle("Military")
            .navigationBarItems(leading: Button {
                
            } label: {
                Image(systemName: "arrow.backward")
            }, trailing: Button {
            } label: {
                Image(systemName: "magnifyingglass")
            })
    }
}

struct CardMilitary: Hashable {
    let title: String
    let imageName: String
}

let leftMilitaryCards: [CardMilitary] = [
    .init(title: "Isakov",
          imageName: "isakov"),
    .init(title: "Bagramyan",
          imageName: "bagramyan"),
    .init(title: "Manouchian",
          imageName: "manouchian"),
    .init(title: "tehlirian",
          imageName: "tehlirian"),
    .init(title: "nzhdeh",
          imageName: "nzhdeh"),
    .init(title: "yerganian",
          imageName: "yerganian"),
    .init(title: "khudyakov",
          imageName: "khudyakov"),
    .init(title: "vartanyan",
          imageName: "vartanyan")
]

let rightMilitaryCards: [CardMilitary] = [
    .init(title: "ozanian",
          imageName: "ozanian"),
    .init(title: "shirakian",
          imageName: "shirakian"),
    .init(title: "silikyan",
          imageName: "silikyan"),
    .init(title: "yanigian",
          imageName: "yanigian"),
    .init(title: "arabo",
          imageName: "arabo"),
    .init(title: "serob",
          imageName: "serob"),
    .init(title: "argutinsky-dolgorukov",
          imageName: "argutinsky-dolgorukov"),
    .init(title: "bek-pirumyan",
          imageName: "bek-pirumyan")
]

struct MilitaryCardView: View {
    let cardmil: CardMilitary
    var body: some View {
        GeometryReader { proxy in
            ZStack {
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
            }
        }
    }
}

