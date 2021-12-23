//
//  ContentView.swift
//  HayHuman
//
//  Created by Геворг on 23.12.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text("Home")
                Spacer()
                HStack(spacing: 0) {
                     TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/28, icon: "theatre", tabName: "Culture")
                     TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/28, icon: "soldier", tabName: "Military")
                     TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/28, icon: "science", tabName: "Science")
                     TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/28, icon: "political", tabName: "Politics")
                     TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/28, icon: "benefit", tabName: "Business")
                 }
                     .frame(width: geometry.size.width, height: geometry.size.height/8)
                     .background(Color("TabBarBackground").shadow(radius: 2))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
