//
//  CultureDetailList.swift
//  HayHuman
//
//  Created by Геворг on 03.01.2022.
//

import SwiftUI

struct CultureDetailList: View {
    @EnvironmentObject var cultureDetail: CultureDetail
    @State var theColorScheme: ColorScheme = .light
    var cardCulture: CultureCard
    
    func toggleColorScheme() {
        theColorScheme = (theColorScheme == .light) ? .dark : .light
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                CultureMapView(coordinate: cultureDetail.selectedCultureProfile?.locationCoordinate ?? cultureCards.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 400)
                    .cornerRadius(10)
                
                
                CultureCircleImage()
                    .offset(y: -90)
                    .padding(.bottom, -100)
                
                
                VStack(alignment: .leading) {
                    Text(cultureDetail.selectedCultureProfile?.name ?? cultureCards.name)
                        .font(.title)
                    
                    HStack {
                        Text(cultureDetail.selectedCultureProfile?.city ?? cultureCards.city)
                        Spacer()
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text(cultureDetail.selectedCultureProfile?.titleDetail ?? cultureCards.titleDetail)
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(4)
                    
                    
                    Text(cultureDetail.selectedCultureProfile?.description ?? cultureCards.description)
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
//                 Text(cultureDetail.selectedCultureProfile?.title ?? cultureCards.title)
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
                cultureDetail.selectedCultureProfile = nil
                cultureDetail.showingCultureProfile = false
            } label: {
                Image(systemName: "arrow.backward.square.fill")
                    .foregroundColor(.secondary)
                    .font(.title)
//                    .shadow(color: .gray, radius: 5, x: 3, y: 0)
            })
            
            .navigationBarItems(trailing: Button {
                self.toggleColorScheme()
                
            } label: {
                Image(systemName: "moon.stars.fill")
                    .foregroundColor(.secondary)
                    .font(.title)
//                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                
            }).preferredColorScheme(theColorScheme)
        }
    }

struct CultureDetailList_Previews: PreviewProvider {
    static var previews: some View {
        CultureDetailList(cardCulture: cardCulture[0])
            .environmentObject(CultureDetail())
            .edgesIgnoringSafeArea(.top)
            
    }
}
