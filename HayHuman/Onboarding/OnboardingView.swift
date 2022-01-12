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
            PageView(title: "Шаг первый",
                     subtitle: "Познакомьтесь с армянским историческим наследием и биографиями выдающихся этнических армян сделавших вклад в историю Армении и Мира.",
                     imageName: "biography",
                     showsDismissButton: true,
                     shouldShowOnboarding: $shouldShowOnboarding
            )
            
            PageView(title: "Шаг второй",
                     subtitle: "Исследуйте армянские церкви со всего мира",
                     imageName: "church(10)",
                     showsDismissButton: true,
                     shouldShowOnboarding: $shouldShowOnboarding

            )
            
            PageView(title: "Шаг третий",
                     subtitle: "Узнайте про видных армянских деятелей современности.",
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
                        .offset(y: 50)
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

