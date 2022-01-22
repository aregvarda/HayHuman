//
//  NavigationBarItems.swift
//  HayHuman
//
//  Created by Геворг on 18.01.2022.
//

import Foundation
import SwiftUI

struct NavigationBarItems: View {
    @ObservedObject var sheetNavigator = SheetNavigator()
    var body: some View {
        
        
        VStack(alignment: .leading) {
            HStack {
                Button {
                    self.sheetNavigator.sheetDestination = .church
    //                self.sheetNavigator.showSheet = true
                } label: {
                    Image("church")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .padding(.trailing, 4)
                        
                    Button {
                        self.sheetNavigator.sheetDestination = .info
    //                    self.sheetNavigator.showSheet = true
                    } label: {
                        Image(systemName: "bubble.left.and.bubble.right")
                            .resizable()
                            .frame(width: 35, height: 30)
                            .foregroundColor(.secondary)
                            .font(.largeTitle.bold())
                            
                    }
                }.sheet(isPresented: self.$sheetNavigator.showSheet) {
                    self.sheetNavigator.sheetView()
                }
            }
        }
    }
}
