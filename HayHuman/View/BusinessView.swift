//
//  BusinessView.swift
//  HayHuman
//
//  Created by Геворг on 23.12.2021.
//

import SwiftUI
import CoreLocation

struct BusinessView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessView()
            .environmentObject(BusinessDetail())
    }
}

struct BusinessView: View {
    
    @EnvironmentObject var businessDetail: BusinessDetail
    @State var searchText = ""
    @State var searching = false
    @State var index = 0
    
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
    
    
    @State var scale: CGFloat = 1.0
    
    
    var body: some View {
        if businessDetail.showingBusinessProfile == false && businessDetail.selectedBusinessProfile == nil {
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
                        Image("b\(index)")
                            .resizable()
                            .scaleEffect(scale)
                        // adding animations
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width - 35)
                        //.frame(width: self.index == index ? 350 : 350, height: self.index == index ? 230 : 180)
                            .cornerRadius(15)
                            .overlay(RoundedRectangle(cornerRadius: 15).fill(Color(.gray).opacity(0.4)))
                            .scaleEffect(self.index == index ? 1.0 : 0.95)
                            .padding(.horizontal)
                        // for identifying current index
                            .tag(index)
                            .gesture(MagnificationGesture()
                                        .onChanged { value in
                                            self.scale = value.magnitude
                                        })
                        
                        
                        
                    }
                }.frame(height: UIDevice.current.userInterfaceIdiom == .pad ? 400 :  230)
                    .padding(.top, 25)
                    .tabViewStyle(PageTabViewStyle())
                    .animation(.easeInOut, value: 1)
                
                HStack {
                    Text("Searching")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: {
                        // reducing to row
                        withAnimation(.easeOut) {
                            if columns.count == 2 {
                                columns.removeLast()
                            } else {
                                columns.append(GridItem(.flexible(), spacing: 15))
                            }
                        }
                    }) {
                        Image(systemName: columns.count == 2 ? "rectangle.grid.1x2": "square.grid.2x2")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 25)
                
                
                LazyVGrid(columns: columns, spacing: 25) {
                    ForEach(cardBusiness.filter({ "\($0)".contains(searchText) || searchText.isEmpty})) { cardbus in
                        VStack {
                            BusGridView(columns: $columns, cardbus: cardbus)
                                .onTapGesture {
                                    withAnimation(.easeOut(duration: 0.1)) {
                                        feedback.impactOccurred()
                                    }
                                    businessDetail.selectedBusinessProfile = cardbus
                                    businessDetail.showingBusinessProfile = true
                                }
                            
                        }
                        .frame(height: UIDevice.current.userInterfaceIdiom == .pad ? 320 : 180)
                        .cornerRadius(15)
                    }
                }
                .padding()
                
            }.navigationBarItems(trailing: Button {
                
            } label: {
                NavigationBarItems()
            })
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Text(searching ? "Searching" : "Business")
                            .fontWeight(.bold)
                            .font(.title)
                        
                    })})
        } else {
            BusinessDetailList(cardBusiness: cardBusiness[0])
            
        }
        
    }
}


struct CardBusiness: Hashable, Codable, Identifiable {
    
    var id: Int
    let title: String
    let imageName: String
    fileprivate var coordinates: BusinessCoordinates
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

struct BusinessCoordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

let cardBusiness: [CardBusiness] = Bundle.main.decode("business.json")
let businessCards: CardBusiness = cardBusiness[0]


struct BusinessCardView: View {
    
    @ScaledMetric var size: CGFloat = 1
    
    let cardbus: CardBusiness
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
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
                
                    .font(.system(size: 15 + size))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(7)
                    .foregroundColor(.white)
                    .shadow(color: .gray, radius: 4, x: 0, y: 0)
            }
        }
    }
}

struct BusGridView: View {
    @Binding var columns: [GridItem]
    @Namespace var namespace
    @ScaledMetric var size: CGFloat = 1
    
    let cardbus: CardBusiness
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 15) {
                if columns.count == 2 {
                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
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
                            
                                .font(.system(size: 15 + size))
                                .fontWeight(.heavy)
                                .multilineTextAlignment(.center)
                                .padding(7)
                                .foregroundColor(.white)
                                .shadow(color: .gray, radius: 4, x: 0, y: 0)
                        }
                } else {
                    HStack(spacing: 15) {
                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                            Image(cardbus.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 185 + size, height: 180 + size)
                                .clipped()
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).fill(Color(.gray).opacity(0.4)))
                        }
                        
                        VStack(alignment: .trailing, spacing: 10) {
                            Text(cardbus.titleDetail)
                                .font(.system(size: 15 + size))
                                .fontWeight(.bold)
                                .lineLimit(nil)
                            }
                        }
                    }
                }
            }
        }
    }
