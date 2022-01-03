//
//  ScienceCircleImage.swift
//  HayHuman
//
//  Created by Геворг on 03.01.2022.
//

import SwiftUI

struct ScienceCircleImage: View {
    @EnvironmentObject var scienceDetail: ScienceDetail
    
    var body: some View {
        Image(scienceDetail.selectedScienceProfile?.imageName ?? scienceCards.imageName)
            .resizable()
            .frame(width: 150, height: 150)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct ScienceCircleImage_Previews: PreviewProvider {
    static var previews: some View {
        ScienceCircleImage()
    }
}
