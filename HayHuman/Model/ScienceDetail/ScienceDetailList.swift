//
//  ScienceDetailList.swift
//  HayHuman
//
//  Created by Геворг on 03.01.2022.
//

import SwiftUI

struct ScienceDetailList: View {
    @EnvironmentObject var scienceDetail: ScienceDetail
    @State var theColorScheme: ColorScheme = .light
    var cardScience: CardScience
    
    func toggleColorScheme() {
        theColorScheme = (theColorScheme == .light) ? .dark : .light
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ScienceMapView(coordinate: scienceDetail.selectedScienceProfile?.locationCoordinate ?? scienceCards.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 400)
                    .cornerRadius(10)
                
                
                ScienceCircleImage()
                    .offset(y: -90)
                    .padding(.bottom, -100)
                
                
                VStack(alignment: .leading) {
                    Text(scienceDetail.selectedScienceProfile?.name ?? scienceCards.name)
                        .font(.title)
                    
                    HStack {
                        Text(scienceDetail.selectedScienceProfile?.city ?? scienceCards.city)
                        Spacer()
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text(scienceDetail.selectedScienceProfile?.titleDetail ?? scienceCards.titleDetail)
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(4)
                    
                    
                    Text(scienceDetail.selectedScienceProfile?.description ?? scienceCards.description)
                        .font(.system(.body, design: .rounded))
                        .multilineTextAlignment(.leading)
                }
                
                .padding()
                
                Spacer()
                
                
            }
        }.navigationBarTitle("")
            .navigationBarItems(leading: Button {
                withAnimation(.easeIn(duration: 0.1)) {
                    feedback.impactOccurred()
                }
                scienceDetail.selectedScienceProfile = nil
                scienceDetail.showingScienceProfile = false
            } label: {
                Image(systemName: "chevron.backward.square.fill")
                    .foregroundColor(.white)
                    .font(.title)
                    .shadow(color: .gray, radius: 5, x: 5, y: 5)
            })
            
            .navigationBarItems(trailing: Button {
                self.toggleColorScheme()
                
            } label: {
                Image(systemName: "switch.2")

                    .font(.title)
                    .shadow(color: .gray, radius: 10, x: 10, y: 10)
                
            }).preferredColorScheme(theColorScheme)
        }
    }
struct ScienceDetailList_Previews: PreviewProvider {
    static var previews: some View {
        ScienceDetailList(cardScience: cardScience[0])
            .environmentObject(ScienceDetail())
            .edgesIgnoringSafeArea(.top)
    }
}
