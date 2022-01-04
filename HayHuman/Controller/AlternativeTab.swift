//
//  AlternativeTab.swift
//  HayHuman
//
//  Created by Геворг on 03.01.2022.
//

import SwiftUI

struct AlternativeTab: View {
    
    @State private var tabIndex = 0
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $tabIndex) {
                    VStack {
//                        NavigationView {
                            CultureView()
                                .environmentObject(CultureDetail())
                                .accentColor(.primary)
//                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .tabItem {
                        Image("theatre")
                        Text("Home")
                    }
                    .tag(0)
                    
                    VStack {
//                        NavigationView {
                        MilitaryView()
                                .environmentObject(MilitaryDetail())
                                .accentColor(.primary)
                                
//                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .tabItem {
                        Image("soldier")
                        Text("Favourite")
                    }
                    .tag(1)
                    
                    VStack {
//                        NavigationView {
                        ScienceView()
                                .environmentObject(ScienceDetail())
                                .accentColor(.primary)
                                
//                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .tabItem {
                        Image("science")
                        Text("Profile")
                    }
                    .tag(2)
                    
                    VStack {
//                        NavigationView {
                            PoliticsView()
                                .environmentObject(PoliticsDetail())
                                .accentColor(.primary)
                                
//                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .tabItem {
                        Image("political")
                            .font(.system(size: 30))
                        Text("Settings")
                    }
                    .tag(3)
                    VStack {
//                        NavigationView {
                            BusinessView()
                                .environmentObject(BusinessDetail())
                                .accentColor(.primary)
                                
//                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .tabItem {
                        Image("benefit")
                            .font(.system(size: 30))
                        Text("Settings")
                    }
                    .tag(4)
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            .navigationBarItems(trailing: Menu(content: {
                Button(action: {
                    withAnimation {
                        tabIndex = 0
                    }
                }) {
                    HStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                }
                
                Button(action: {
                    withAnimation {
                        tabIndex = 1
                    }
                }) {
                    HStack {
                        Image(systemName: "heart.fill")
                        Text("Favourite")
                    }
                }
            
                Button(action: {
                    withAnimation {
                        tabIndex = 2
                    }
                }) {
                    HStack {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                }
            
                Button(action: {
                    withAnimation {
                        tabIndex = 3
                    }
                }) {
                    HStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
            }, label: {
                Image(systemName: "line.horizontal.3")
            }))
        }
    }
}

