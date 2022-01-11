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
    @State var searchText = ""
    @State var searching = false
    @State var index = 0
    
    @State var showSheetView = false
    @State var churchShowSheetView = false
    
    var body: some View {
        if politicsDetail.showingPoliticsProfile == false && politicsDetail.selectedPoliticsProfile == nil {
            ScrollView(.vertical, showsIndicators: false) {
                
                SearchBar(searchText: $searchText, searching: $searching)
                    .toolbar {
                        if searching {
                            Button("Cancel") {
                                searchText = ""
                                withAnimation {
                                    searching = false
                                    UIApplication.shared.dismissKeyboard()
                                }
                            }
                        }
                    }
                    .gesture(DragGesture()
                                .onChanged({ _ in
                        UIApplication.shared.dismissKeyboard()
                    })
                    )
                
                // Carousel List
                TabView(selection: $index) {
                    ForEach(0...5, id: \.self) { index in
                        Image("g\(index)")
                            .resizable()
                        // adding animations
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width - 35)
                        //.frame(width: self.index == index ? 350 : 350, height: self.index == index ? 230 : 180)
                            .cornerRadius(15)
                            .overlay(RoundedRectangle(cornerRadius: 15).fill(Color(.gray).opacity(0.4)))
                            .scaleEffect(self.index == index ? 1.0 : 0.85)
                            .padding(.horizontal)
                        // for identifying current index
                            .tag(index)
                        
                        
                        
                    }
                }.frame(height: UIDevice.current.userInterfaceIdiom == .pad ? 400 :  230)
                    .padding(.top, 25)
                    .tabViewStyle(PageTabViewStyle())
                    .animation(.easeOut, value: 1)
                
                LazyVGrid(columns: gridLayout, spacing: 25) {
                    ForEach(cardPolitics.filter({ "\($0)".contains(searchText) || searchText.isEmpty})) { cardpol in
                        VStack {
                            PoliticsCardView(cardpol: cardpol)
                                .onTapGesture {
                                    withAnimation(.easeOut(duration: 0.1)) {
                                        feedback.impactOccurred()
                                    }
                                    politicsDetail.selectedPoliticsProfile = cardpol
                                    politicsDetail.showingPoliticsProfile = true
                                }
                            
                        }
                        .frame(height: UIDevice.current.userInterfaceIdiom == .pad ? 320 : 180)
                        .cornerRadius(15)
                    }
                }
                .padding()
                
            }.navigationBarItems(trailing: Button {
                
                self.showSheetView.toggle()
            } label: {
                Image(systemName: "info.circle")
                    .foregroundColor(.secondary)
                    .font(.title)
            }).sheet(isPresented: $showSheetView, content: {
                About()
            })
            
            .navigationBarItems(trailing: Button {
            self.churchShowSheetView.toggle()
        } label: {
            Image("church")
                .resizable()
                .frame(width: 35, height: 35)
                .offset(x: 10)
        }).sheet(isPresented: $churchShowSheetView, content: {
            ChurchesList()
        })
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Text(searching ? "Searching" : "Politics")
                            .fontWeight(.bold)
                            .font(.title)
                        
                    })})
        } else {
            PoliticsDetailList(cardPolitics: cardPolitics[0])
            
        }
        
    }
}

struct CardPolitics: Hashable, Codable, Identifiable {
    
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

struct PoliticsCoordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

let cardPolitics: [CardPolitics] = Bundle.main.decode("politics.json")
let politicsCards: CardPolitics = cardPolitics[0]


struct PoliticsCardView: View {
    let cardpol: CardPolitics
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
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
                    .shadow(color: .gray, radius: 4, x: 0, y: 0)
            }
        }
    }
}


