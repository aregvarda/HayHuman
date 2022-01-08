//
//  Help.swift
//  HayHuman
//
//  Created by Геворг on 07.01.2022.
//

import SwiftUI

struct Help: View {
    var body: some View{
        Text("Welcome to the Chats Page!")
            .navigationBarTitle("Help")
            .frame(maxWidth:.infinity,maxHeight: .infinity)
    }
}

struct Help_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Help()
        }
    }
}
