//
//  OnboardingView.swift
//  HayHuman
//
//  Created by Геворг on 11.01.2022.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var shouldShowOnboarding: Bool


    var body: some View {
        TabView {
            PageView(title: "Step One",
                     subtitle: "It will be written here about the contribution of ethnic Armenians to world history",
                     imageName: "biography",
                     showsDismissButton: false,
                     shouldShowOnboarding: $shouldShowOnboarding
            )
            
            PageView(title: "Step Two",
                     subtitle: "It will be written here about the study of churches",
                     imageName: "church(10)",
                     showsDismissButton: false,
                     shouldShowOnboarding: $shouldShowOnboarding

            )
            
            PageView(title: "Step Three",
                     subtitle: "It will be written about modern ethnic Armenians",
                     imageName: "chemistry",
                     showsDismissButton: true,
                     shouldShowOnboarding: $shouldShowOnboarding

            )
            
            
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct PageView: View {
    
    let title: String
    let subtitle: String
    let imageName: String
    let showsDismissButton: Bool
    @Binding var shouldShowOnboarding: Bool

    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding()
            
            Text(title)
                .font(.system(size: 32))
                .padding()
            
            Text(subtitle)
                .font(.system(size: 24))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.secondaryLabel))
                .padding()
            
            if showsDismissButton {
                Button {
                    shouldShowOnboarding.toggle()
                } label: {
                    Text("Get Started")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.orange)
                        .cornerRadius(6)
                }

            }
        }
    }
}

//#if DEBUG
//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
//    }
//}
//#endif

