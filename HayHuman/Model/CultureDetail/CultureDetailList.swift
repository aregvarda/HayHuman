//
//  CultureDetailList.swift
//  HayHuman
//
//  Created by Геворг on 03.01.2022.
//

import SwiftUI

struct CultureDetailList: View {
    @EnvironmentObject var cultureDetail: CultureDetail
    var cardCulture: CultureCard
    
    let email = "HayHumanApp@gmail.com"
    @State private var isDarkMode = false
    
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

        .navigationBarTitle("")
            .navigationBarItems(leading: Button {
                withAnimation(.easeIn(duration: 0.1)) {
                    feedback.impactOccurred()
                }
                cultureDetail.selectedCultureProfile = nil
                cultureDetail.showingCultureProfile = false
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

struct CultureDetailList_Previews: PreviewProvider {
    static var previews: some View {
        CultureDetailList(cardCulture: cardCulture[0])
            .environmentObject(CultureDetail())
            .edgesIgnoringSafeArea(.top)
            
    }
}


