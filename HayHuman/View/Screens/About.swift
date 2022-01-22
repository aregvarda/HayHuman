//
//  Screens.swift
//  HayHuman
//
//  Created by Геворг on 07.01.2022.
//

import SwiftUI

struct About : View {
    @ScaledMetric var size: CGFloat = 1
    
    let email = "HayHumanApp@gmail.com"
    
        var body: some View {

            VStack(alignment: .leading) {
                HStack(spacing: 185) {
                Text("Инфо")
//                    .font(.title2.bold())
                    .font(.system(size: 25 + size))
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
//                    .multilineTextAlignment(.leading)
                    .padding(.leading, 25)
                    .lineLimit(0)
//                    .padding(.top, 25)
//                    .padding(.bottom, 10)
                    
//                Toggle("", isOn: $isDarkMode)
//                        .padding(.trailing, 20)
                    
                    Button {
                        if let url = URL(string: "mailto:\(email)") {
                          if #available(iOS 10.0, *) {
                            UIApplication.shared.open(url)
                          } else {
                            UIApplication.shared.openURL(url)
                          }
                        }
                    } label: {
                        Image(systemName: "envelope.open")
                            .padding(.trailing, 5)
                            .padding(.top, 25)
                            .padding(.bottom, 15)
                            .font(.title2.bold())
                            .foregroundColor(.secondary)
                    }
                }
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 30){
                        //
                        ForEach(letters){
                            letter in LetterCardView(letter: letter)
                            //
                        }
                    }
                    Text("HayHumanApp@gmail.com")
                        .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.bottom)
                }
                .coordinateSpace(name: "SCROLL")
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color("ColorChurch")
                    .ignoresSafeArea()
            )
        }
}


struct Screens_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            About()
        }
    }
}


struct OffsetModifier: ViewModifier {
    
    @Binding var rect: CGRect
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader{proxy in
                    Color.clear
                        .preference(key: OffsetKey.self, value: proxy.frame(in: .named("SCROLL")))
                }
            )
            .onPreferenceChange(OffsetKey.self){ value in
                self.rect = value
            }
    }
}

//Offset preference key
struct OffsetKey: PreferenceKey{
    
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
    
}

