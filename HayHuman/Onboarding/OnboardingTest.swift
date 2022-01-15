//
//  OnboardingTest.swift
//  HayHuman
//
//  Created by Геворг on 13.01.2022.
//

import Foundation
import SwiftUI

// Intro Model And Sample Intro's...
struct Intro: Identifiable{
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
    var color: Color
    let showsDismissButton: Bool
    
}

var intros : [Intro] = [

    Intro(image: "biography", title: "Шаг первый", description: "Познакомьтесь с армянским историческим наследием и биографиями выдающихся этнических армян сделавших вклад в историю Армении и Мира.", color: Color("Blue"), showsDismissButton: false),
    Intro(image: "scientist", title: "Шаг второй", description: "Узнайте про видных армянских деятелей современности.",color: Color("Yellow"), showsDismissButton: false),
    Intro(image: "church(10)", title: "Шаг третий", description: "Исследуйте армянские церкви со всего мира",color: Color("Pink"), showsDismissButton: true),
]


struct Home: View {
    
    var screenSize: CGSize
    @State var offset: CGFloat = 0
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        
        VStack{
            
            Button {
                shouldShowOnboarding.toggle()
            } label: {
                Text("Skip")
                    .foregroundColor(.white)
                    
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            OffsetPageTabView(offset: $offset) {
                

                HStack(spacing: 0){
                 
                    ForEach(intros){intro in
                     
                        VStack{
                            
                            Image(intro.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: screenSize.height / 3)
                            
                            VStack(alignment: .leading, spacing: 22) {
                                
                                Text(intro.title)
                                    .font(.largeTitle.bold())
                                
                                Text(intro.description)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.secondary)
                            }
                            .foregroundStyle(.white)
                            .padding(.top,50)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            
                            if intro.showsDismissButton {
                                        Button {
                                            shouldShowOnboarding.toggle()
                                        } label: {
                                            Text("Get Started")
                                                .bold()
                                                .foregroundColor(Color.white)
                                                .frame(width: 150, height: 50)
                                                .background(Color.orange)
                                                .cornerRadius(6)
                                                .offset(y: 50)
                                        }
                            
                                    }
                        }
                        .padding()
                        // setitng max Width..
                        .frame(width: screenSize.width)
                    }
                }
            }
            
            // Animated Indicator....
            HStack(alignment: .bottom) {
                
                // Indicators...
                HStack(spacing: 12){
                    
                    ForEach(intros.indices,id: \.self){index in
                        
                        Capsule()
                            .fill(.white)
                        // increasing width for only current index...
                            .frame(width: getIndex() == index ? 20 : 7, height: 7)
                    }
                }
                .overlay(
                
                    Capsule()
                        .fill(.white)
                        .frame(width: 20, height: 7)
                        .offset(x: getIndicatorOffset())
                    
                    ,alignment: .leading
                )
                .offset(x: 10, y: -15)
                
                Spacer()
                
                Button {
                    
                    // updating offset...
                    let index = min(getIndex() + 1, intros.count - 1)
                    
                    offset = CGFloat(index) * screenSize.width
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .padding(20)
                        .background(
                        
                            intros[getIndex()].color,
                            in: Circle()
                        )
                }

            }
            .padding()
            .offset(y: -20)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        // Animating when index Changes...
        .animation(.easeInOut,value: getIndex())
        
//        if showsDismissButton {
//            Button {
//                shouldShowOnboarding.toggle()
//            } label: {
//                Text("Get Started")
//                    .bold()
//                    .foregroundColor(Color.white)
//                    .frame(width: 150, height: 50)
//                    .background(Color.orange)
//                    .cornerRadius(6)
//                    .offset(y: -80)
//            }
//
//        }
    }
    
    // offset for indicator...
    func getIndicatorOffset()->CGFloat{
        
        let progress = offset / screenSize.width
        
        // 12 = spacing
        // 7 = Circle size...
        
        let maxWidth: CGFloat = 12 + 7
        
        return progress * maxWidth
    }
    
    // Expading index based on offset...
    func getIndex()->Int{
        
        let progress = round(offset / screenSize.width)
        
        // For Saftey...
        let index = min(Int(progress), intros.count - 1)
        return index
    }
}

struct OffsetPageTabView<Content: View>: UIViewRepresentable {
    
    var content: Content
    @Binding var offset: CGFloat
    
    
    func makeCoordinator() -> Coordinator {
        return OffsetPageTabView.Coordinator(parent: self)
    }
    
    init(offset: Binding<CGFloat>,@ViewBuilder content: @escaping ()->Content){
        
        self.content = content()
        self._offset = offset
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let scrollview = UIScrollView()
        
        // Extracting SwiftUI View and embedding into UIKit ScrollView...
        let hostview = UIHostingController(rootView: content)
        hostview.view.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
        
            hostview.view.topAnchor.constraint(equalTo: scrollview.topAnchor),
            hostview.view.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            hostview.view.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            hostview.view.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor),
            
            // if you are using vertical Paging...
            // then dont declare height constraint...
            hostview.view.heightAnchor.constraint(equalTo: scrollview.heightAnchor)
        ]
        
        scrollview.addSubview(hostview.view)
        scrollview.addConstraints(constraints)
        
        // ENabling Paging...
        scrollview.isPagingEnabled = true
        scrollview.showsVerticalScrollIndicator = false
        scrollview.showsHorizontalScrollIndicator = false
        
        // setting Delegate...
        scrollview.delegate = context.coordinator
        
        return scrollview
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        // need to update only when offset changed manually...
        // just check the current and scrollview offsets...
        let currentOffset = uiView.contentOffset.x
        
        if currentOffset != offset{
        
            print("updating")
            uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        }
    }
    
    // Pager Offset...
    class Coordinator: NSObject,UIScrollViewDelegate{
        
        var parent: OffsetPageTabView
        
        init(parent: OffsetPageTabView) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offset = scrollView.contentOffset.x
            
            parent.offset = offset
        }
    }
}
