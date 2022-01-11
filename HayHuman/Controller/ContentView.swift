//
//  ContentView.swift
//  HayHuman
//
//  Created by Геворг on 23.12.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewRouter: ViewRouter
//    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    @State var shouldShowOnboarding: Bool = true
    
    var body: some View {
        TabViewPlace(viewRouter: ViewRouter())
        //        AlternativeTab()
            .fullScreenCover(isPresented: $shouldShowOnboarding) {
                OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
        //        ContentView()
    }
}
