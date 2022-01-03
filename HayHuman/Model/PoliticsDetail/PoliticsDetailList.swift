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
        }.navigationBarTitle("")
            .navigationBarItems(leading: Button {
                withAnimation(.easeIn(duration: 0.1)) {
                    feedback.impactOccurred()
                }
                politicsDetail.selectedPoliticsProfile = nil
                politicsDetail.showingPoliticsProfile = false
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


struct PoliticsDetailList_Previews: PreviewProvider {
    static var previews: some View {
        PoliticsDetailList(cardPolitics: cardPolitics[0])
            .environmentObject(PoliticsDetail())
            .edgesIgnoringSafeArea(.top)
    }
}
