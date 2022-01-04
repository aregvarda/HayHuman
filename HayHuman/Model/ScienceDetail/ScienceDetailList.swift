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
        }
//        .toolbar(content: {
//            ToolbarItem(placement: .principal, content: {
//             Text(scienceDetail.selectedScienceProfile?.title ?? scienceCards.title)
//             .fontWeight(.bold)
//             .font(.title2)
//                
//             
//          })})
        .navigationBarTitle("")
            .navigationBarItems(leading: Button {
                withAnimation(.easeIn(duration: 0.1)) {
                    feedback.impactOccurred()
                }
                scienceDetail.selectedScienceProfile = nil
                scienceDetail.showingScienceProfile = false
            } label: {
                Image(systemName: "arrow.backward.square.fill")
                    .foregroundColor(.secondary)
                    .font(.title)
            })
            
            .navigationBarItems(trailing: Button {
                self.toggleColorScheme()
                
            } label: {
                Image(systemName: "moon.stars.fill")
                    .foregroundColor(.secondary)
                    .font(.title)
                
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
