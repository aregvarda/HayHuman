//
//  TabBarIcon.swift
//  HayHuman
//
//  Created by Геворг on 23.12.2021.
//

import SwiftUI

struct TabBarIcon: View {
    @ScaledMetric var size: CGFloat = 1

    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page  
    let width, height: CGFloat
    let icon, tabName: String
    
    var body: some View {
        VStack {
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
//                .font(.footnote)
                .font(.system(size: 11 + size))
                .fontWeight(.bold)
            Spacer()
        }
        .foregroundColor(viewRouter.currentPage == assignedPage ? Color("TabBarHighlight") : .gray)
        .onTapGesture { viewRouter.currentPage = assignedPage
        }
    }
}


