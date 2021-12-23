//
//  ContentView.swift
//  HayHuman
//
//  Created by Геворг on 23.12.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                switch viewRouter.currentPage {
                case .culture:
                    Text("Culture")
                case .military:
                    Text("Military")
                case .science:
                    Text("Science")
                case .politics:
                    Text("Politics")
                case .business:
                    Text("Business")
                }
                Spacer()
                HStack(spacing: 0) {
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .culture, width: geometry.size.width/5, height: geometry.size.height/28, icon: "theatre", tabName: "Culture")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .military, width: geometry.size.width/5, height: geometry.size.height/28, icon: "soldier", tabName: "Military")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .science, width: geometry.size.width/5, height: geometry.size.height/28, icon: "science", tabName: "Science")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .politics, width: geometry.size.width/5, height: geometry.size.height/28, icon: "political", tabName: "Politics")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .business, width: geometry.size.width/5, height: geometry.size.height/28, icon: "benefit", tabName: "Business")
                }
                .frame(width: geometry.size.width, height: geometry.size.height/8)
                .background(Color("TabBarBackground").shadow(radius: 2))
            }
        }.edgesIgnoringSafeArea(.bottom)
            .padding(.horizontal, -2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
