//
//  CultureCircleImage.swift
//  HayHuman
//
//  Created by Геворг on 03.01.2022.
//

import SwiftUI

struct CultureCircleImage: View {
    @EnvironmentObject var cultureDetail: CultureDetail

    var body: some View {
        Image(cultureDetail.selectedCultureProfile?.imageName ?? cultureCards.imageName)
            .resizable()
            .frame(width: 150, height: 150)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CultureCircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CultureCircleImage()
    }
}
