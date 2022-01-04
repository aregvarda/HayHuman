//
//  PoliticsDetailList.swift
//  HayHuman
//
//  Created by Геворг on 03.01.2022.
//

import SwiftUI

struct PoliticsDetailList: View {
    @EnvironmentObject var politicsDetail: PoliticsDetail
    @State var theColorScheme: ColorScheme = .light
    var cardPolitics: CardPolitics
    
    func toggleColorScheme() {
        theColorScheme = (theColorScheme == .light) ? .dark : .light
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                PoliticsMapView(coordinate: politicsDetail.selectedPoliticsProfile?.locationCoordinate ?? cardPolitics.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 400)
                    .cornerRadius(10)
                
                
                PoliticsCircleImage()
                    .offset(y: -90)
                    .padding(.bottom, -100)
                
                
                VStack(alignment: .leading) {
                    Text(politicsDetail.selectedPoliticsProfile?.name ?? cardPolitics.name)
                        .font(.title)
                    
                    HStack {
                        Text(politicsDetail.selectedPoliticsProfile?.city ?? cardPolitics.city)
                        Spacer()
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text(politicsDetail.selectedPoliticsProfile?.titleDetail ?? cardPolitics.titleDetail)
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(4)
                    
                    
                    Text(politicsDetail.selectedPoliticsProfile?.description ?? cardPolitics.description)
                        .font(.system(.body, design: .rounded))
                        .multilineTextAlignment(.leading)
                }
                
                .padding()
                
                Spacer()
                
                
            }
        }
//        .navigationBarTitleDisplayMode(.inline)
//            .toolbar(content: {
//                ToolbarItem(placement: .principal, content: {
//                 Text(politicsDetail.selectedPoliticsProfile?.title ?? politicsCards.title)
//                 .fontWeight(.bold)
//                 .font(.title2)
//                 .foregroundColor(.secondary)
//                 
//              })})
        .navigationBarTitle("")
            .navigationBarItems(leading: Button {
                withAnimation(.easeIn(duration: 0.1)) {
                    feedback.impactOccurred()
                }
                politicsDetail.selectedPoliticsProfile = nil
                politicsDetail.showingPoliticsProfile = false
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


struct PoliticsDetailList_Previews: PreviewProvider {
    static var previews: some View {
        PoliticsDetailList(cardPolitics: cardPolitics[0])
            .environmentObject(PoliticsDetail())
            .edgesIgnoringSafeArea(.top)
    }
}
