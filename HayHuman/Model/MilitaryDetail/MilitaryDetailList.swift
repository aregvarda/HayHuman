//
//  MilitaryDetailList.swift
//  HayHuman
//
//  Created by Геворг on 03.01.2022.
//

import SwiftUI

struct MilitaryDetailList: View {
    @EnvironmentObject var militaryDetail: MilitaryDetail
    var cardMilitary: CardMilitary
    
    let email = "HayHumanApp@gmail.com"
    @State private var isDarkMode = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                MilitaryMapView(coordinate: militaryDetail.selectedMilitaryProfile?.locationCoordinate ?? cardMilitary.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 400)
                    .cornerRadius(10)
                
                
                MilitaryCircleImage()
                    .offset(y: -90)
                    .padding(.bottom, -100)
                
                
                VStack(alignment: .leading) {
                    Text(militaryDetail.selectedMilitaryProfile?.name ?? cardMilitary.name)
                        .font(.title)
                    
                    HStack {
                        Text(militaryDetail.selectedMilitaryProfile?.city ?? cardMilitary.city)
                        Spacer()
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text(militaryDetail.selectedMilitaryProfile?.titleDetail ?? cardMilitary.titleDetail)
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(4)
                    
                    
                    Text(militaryDetail.selectedMilitaryProfile?.description ?? cardMilitary.description)
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
                militaryDetail.selectedMilitaryProfile = nil
                militaryDetail.showingMilitaryProfile = false
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


struct MilitaryDetailList_Previews: PreviewProvider {
    static var previews: some View {
        MilitaryDetailList(cardMilitary: cardMilitary[0])
            .environmentObject(MilitaryDetail())
            .edgesIgnoringSafeArea(.top)
    }
}
