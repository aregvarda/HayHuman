//
//  BusinessCircleImage.swift
//  HayHuman
//
//  Created by Геворг on 26.12.2021.
//

import SwiftUI

struct BusinessCircleImage: View {
    @EnvironmentObject var businessDetail: BusinessDetail
    var body: some View {
        Image(businessDetail.selectedBusinessProfile?.imageName ?? businessCards.imageName)
            .resizable()
            .frame(width: 150, height: 150)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct BusinessCircleImage_Previews: PreviewProvider {
    static var previews: some View {
        BusinessCircleImage()
            .environmentObject(BusinessDetail())
    }
}
