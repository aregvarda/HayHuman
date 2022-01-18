//
//  ScienceDetailList.swift
//  HayHuman
//
//  Created by Геворг on 03.01.2022.
//

import SwiftUI

struct ScienceDetailList: View {
    @EnvironmentObject var scienceDetail: ScienceDetail
    var cardScience: CardScience
    
    let email = "HayHumanApp@gmail.com"
    @State private var isDarkMode = false
    
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

        .navigationBarTitle("")
            .navigationBarItems(leading: Button {
                withAnimation(.easeIn(duration: 0.1)) {
                    feedback.impactOccurred()
                }
                scienceDetail.selectedScienceProfile = nil
                scienceDetail.showingScienceProfile = false
            } label: {
                Image(systemName: "chevron.backward")
                    .font(.title2.bold())
                    .foregroundColor(.secondary)
            })
            .navigationBarItems(trailing: Button {
                if let url = URL(string: "mailto:\(email)") {
                  if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url)
                  } else {
                    UIApplication.shared.openURL(url)
                  }
                }
            } label: {
                Image(systemName: "envelope.open")
                    .padding(.bottom, 5)
                    .font(.title2.bold())
                    .foregroundColor(.secondary)
            })
            
            .navigationBarItems(trailing: Button {
            } label: {
                Toggle(isOn: $isDarkMode, label: {

                    Text("")
                        
                }).toggleStyle(SwitchToggleStyle(tint: .green))

                
            }).preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
struct ScienceDetailList_Previews: PreviewProvider {
    static var previews: some View {
        ScienceDetailList(cardScience: cardScience[0])
            .environmentObject(ScienceDetail())
            .edgesIgnoringSafeArea(.top)
    }
}
