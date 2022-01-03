//
//  MilitaryDetailList.swift
//  HayHuman
//
//  Created by Геворг on 03.01.2022.
//

import SwiftUI

struct MilitaryDetailList: View {
    @EnvironmentObject var militaryDetail: MilitaryDetail
    @State var theColorScheme: ColorScheme = .light
    
    var cardMilitary: CardMilitary
    
    func toggleColorScheme() {
        theColorScheme = (theColorScheme == .light) ? .dark : .light
    }
    
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
        }.navigationBarTitle("")
            .navigationBarItems(leading: Button {
                withAnimation(.easeIn(duration: 0.1)) {
                    feedback.impactOccurred()
                }
                militaryDetail.selectedMilitaryProfile = nil
                militaryDetail.showingMilitaryProfile = false
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


struct MilitaryDetailList_Previews: PreviewProvider {
    static var previews: some View {
        MilitaryDetailList(cardMilitary: cardMilitary[0])
            .environmentObject(MilitaryDetail())
            .edgesIgnoringSafeArea(.top)
    }
}
