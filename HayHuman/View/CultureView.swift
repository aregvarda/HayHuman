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
    @State var searchText = ""
    @State var searching = false
    @State var index = 0
    
    @State var showSheetView = false
    @State var churchShowSheetView = false
    
    @State var scale: CGFloat = 1.0
    
    
    var body: some View {
        ZStack {
            if cultureDetail.showingCultureProfile == false && cultureDetail.selectedCultureProfile == nil {
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
                            Image("p\(index)")
                                .resizable()
                                .scaleEffect(scale)
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
                                .gesture(MagnificationGesture()
                                            .onChanged { value in
                                                self.scale = value.magnitude
                                            })
                            
                            
                            
                        }
                    }
                    .frame(height: UIDevice.current.userInterfaceIdiom == .pad ? 400 :  230)
                    .padding(.top, 25)
                    .tabViewStyle(PageTabViewStyle())
                    .animation(.easeOut, value: 1)
                    
                    
                    LazyVGrid(columns: gridLayout, spacing: 25) {
                        ForEach(cardCulture.filter({ "\($0)".contains(searchText) || searchText.isEmpty})) { card in
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
                            .frame(height: UIDevice.current.userInterfaceIdiom == .pad ? 320 : 180)
                            .cornerRadius(15)
                        }
                        
                    }
                    .padding()
                    
                }
                
                .navigationBarItems(trailing: Button {
                    self.showSheetView.toggle()
                } label: {
                    Image(systemName: "bubble.left.and.bubble.right")
                        .resizable()
                        .frame(width: 35, height: 30)
                        .foregroundColor(.secondary)
                        .font(.largeTitle.bold())
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
                            Text(searching ? "Searching" : "Culture")
                                .fontWeight(.bold)
                                .font(.title)
                            
                        })})
            } else {
                CultureDetailList(cardCulture: cardCulture[0])
                
            }
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



