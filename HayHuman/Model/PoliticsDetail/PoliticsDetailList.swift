//
//  PoliticsDetailList.swift
//  HayHuman
//
//  Created by Геворг on 03.01.2022.
//

import SwiftUI

struct PoliticsDetailList: View {
    @EnvironmentObject var politicsDetail: PoliticsDetail
    var cardPolitics: CardPolitics
    
    let email = "HayHumanApp@gmail.com"
    @State private var isDarkMode = false
    
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

        .navigationBarTitle("")
            .navigationBarItems(leading: Button {
                withAnimation(.easeIn(duration: 0.1)) {
                    feedback.impactOccurred()
                }
                politicsDetail.selectedPoliticsProfile = nil
                politicsDetail.showingPoliticsProfile = false
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


struct PoliticsDetailList_Previews: PreviewProvider {
    static var previews: some View {
        PoliticsDetailList(cardPolitics: cardPolitics[0])
            .environmentObject(PoliticsDetail())
            .edgesIgnoringSafeArea(.top)
    }
}
