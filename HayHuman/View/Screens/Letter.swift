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
    Letter(date: "Главное", title: "Основная информация.", descript: "Данное приложение создано под патронажем Российской и Ново-Нахичеванской епархии Святой Армянской Апостольской Церкви. Цель продукта: Ознакомления с армянским историческим наследием и биографиями выдающихся этнических армян сделавших вклад в историю Армении и Мира. Приложение не несёт в себе цели оскорбить какую-либо социальную группу, вся информация была собрана из открытых источников. Если вам нравится проект HayHuman, и вы хотели бы поддержать нас, то можете поставить оценку нашему приложению в AppStore или связаться с нами по почте указанной ниже."),
    Letter(date: "Дополнительно", title: "Дополнительная информация", descript: "Большая часть биографий были взяты из интернет-энциклопедии Wikipedia, а также из общедоступных статей и книг. Если вы считаете, что в HayHuman необходимо добавить какую-либо личность или церковь, то пожалуйста, свяжитесь с нами по указанной ниже почте."),
    Letter(date: "Политика использования данных", title: "", descript: "Нам необходимо обрабатывать информацию о вашем местоположении для улучшения качества локализации нашего продукта, чтобы сделать наш проект более доступным.")
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
