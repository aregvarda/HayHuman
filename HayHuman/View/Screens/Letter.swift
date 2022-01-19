//
//  Letter.swift
//  HayHuman
//
//  Created by Геворг on 12.01.2022.
//

import Foundation
import SwiftUI

struct Letter: Identifiable, Hashable{
    var id = UUID().uuidString
    var date: String
    var title: String
    var descript: String
}

var letters: [Letter] = [
    Letter(date: "Main", title: "Main information", descript: "This application was created under the patronage of the Russian and New Nakhichevan Diocese of the Holy Armenian Apostolic Church. The purpose of the product: To get acquainted with the Armenian historical heritage and biographies of outstanding ethnic Armenians who have made a contribution to the history of Armenia and the World. The application does not aim to offend any social group, all information was collected from open sources. If you like the HayHuman project and would like to support us, then you can rate our application in the AppStore or contact us by the email listed below."),
    Letter(date: "Additionally", title: "Additional information", descript: "Most of the biographies were taken from the Internet encyclopedia Wikipedia, as well as from publicly available articles and books. If you think that it is necessary to add any person or church to HayHuman, then please contact us by the email below."),
    Letter(date: "Data Usage Policy", title: "", descript: "We need to process information about your location to improve the localization quality of our product in order to make our project more accessible.")
]

struct LetterCardView: View{
    var letter: Letter
    
    @State var rect: CGRect = .zero
    
    var body: some View{
        
        VStack(spacing: 15){
            VStack(alignment: .leading, spacing: 12){
                Text(letter.date)
                    .font(.title2.bold())
                    .foregroundColor(.black)
                Text(letter.title)
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
                .padding(.vertical, 10)
            
            
            Text(letter.descript)
                .lineSpacing(11)
                .multilineTextAlignment(.leading)
                .foregroundColor(.gray)
        }
        .padding()
        .background(
            Color.white
                .cornerRadius(6)
        )
        //masking view , like letter is shrinking
        .mask(){
            Rectangle()
                .padding(.top, rect.minY < (getIndex() * 50) ? -(rect.minY - (getIndex() * 50)) : 0)
        }
        .offset(y: rect.minY < (getIndex() * 50) ? (rect.minY - (getIndex() * 50)) : 0)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
        //stop back ward scrolling...
        
        .overlay(
            ScrolledLetterShape()
            
            , alignment: .top
        )

        //offset(y: rect.minY < 0 ? -(rect.minY) : 0)
        .offset(y: rect.minY < (getIndex() * 50) ? -(rect.minY - (getIndex() * 50)) : 0)
        .modifier(OffsetModifier(rect: $rect))
        
        .background(
            Text("свяжитесь с нами")
                .font(.title.bold())
                .foregroundColor(.white)
                .opacity(isLast() ? 1 : 0)
                .offset(y: rect.minY < 0 ? -rect.minY : 0)
        )
        
        //appling bottom padding for last letter to allow scrolling
        .padding(.bottom, isLast() ? rect.height : 0)
    }
    
    func isLast()->Bool{
        return letters.last == letter
    }
    
    func getIndex()->CGFloat{
        let index = letters.firstIndex { letter in
            return self.letter.id == letter.id
        } ?? 0
        
        return CGFloat(index)
    }
    
    
    func getProgress()->CGFloat{
        let progress = -rect.minY / rect.height
        
        return (progress > 0 ? (progress < 1 ? progress : 1) : 0)
    }
        
    @ViewBuilder
    func ScrolledLetterShape()->some View{
        Rectangle()
            .fill(Color.white)
            .frame(height: 30 * getProgress())
            .overlay(
                Rectangle()
                    .fill(
                        .linearGradient(.init(colors: [
                            Color.black.opacity(0.1),
                            Color.clear,
                            Color.black.opacity(0.1),
                            Color.black.opacity(0.05)
                        ]), startPoint: .top, endPoint: .bottom)
                    )
                , alignment: .top
            )
            .cornerRadius(6)
            .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.06), radius: 5, x: -5, y: -5)
    }
    
}
