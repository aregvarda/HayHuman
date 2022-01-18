//
//  BusinessDetailList.swift
//  HayHuman
//
//  Created by Геворг on 26.12.2021.
//

import SwiftUI


struct BusinessDetailList: View {
    @EnvironmentObject var businessDetail: BusinessDetail
    var cardBusiness: CardBusiness
    
    let email = "HayHumanApp@gmail.com"
    @State private var isDarkMode = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                BusinessMapView(coordinate: businessDetail.selectedBusinessProfile?.locationCoordinate ?? cardBusiness.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 400)
                    .cornerRadius(10)
                
                
                BusinessCircleImage()
                    .offset(y: -90)
                    .padding(.bottom, -100)
                
                
                VStack(alignment: .leading) {
                    Text(businessDetail.selectedBusinessProfile?.name ?? businessCards.name)
                        .font(.title)
                    
                    HStack {
                        Text(businessDetail.selectedBusinessProfile?.city ?? businessCards.city)
                        Spacer()
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text(businessDetail.selectedBusinessProfile?.titleDetail ?? businessCards.titleDetail)
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(4)
                    
                    
                    Text(businessDetail.selectedBusinessProfile?.description ?? businessCards.description)
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
                businessDetail.selectedBusinessProfile = nil
                businessDetail.showingBusinessProfile = false
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



struct BusinessDetailList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetailList(cardBusiness: cardBusiness[0])
            .environmentObject(BusinessDetail())
            .edgesIgnoringSafeArea(.top)
    }
}

