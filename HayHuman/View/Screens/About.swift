//
//  Screens.swift
//  HayHuman
//
//  Created by Геворг on 07.01.2022.
//

import SwiftUI

struct About : View {
    
        var body: some View {
            
            VStack{
                Text("Информация")
                    .font(.largeTitle.bold())
                    .foregroundColor(.secondary)
                    .padding(.top, 25)
                    .padding(.bottom, 30)
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

