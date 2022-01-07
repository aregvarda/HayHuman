//
//  ChurchesList.swift
//  HayHuman
//
//  Created by Геворг on 07.01.2022.
//

import SwiftUI

struct ChurchesList: View {
    var body: some View{
        Text("Welcome to the Leaderbaord Page!")
            .navigationBarTitle("Armenian churches")
            .frame(maxWidth:.infinity,maxHeight: .infinity)
    }
}

struct ChurchesList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChurchesList()
        }
    }
}
