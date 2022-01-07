//
//  Screens.swift
//  HayHuman
//
//  Created by Геворг on 07.01.2022.
//

import SwiftUI

struct About : View {
    
    var body: some View{
        Text("This is a non top level destination as you can see!")
            .navigationBarTitle("About")
            .edgesIgnoringSafeArea(.vertical)//order of arrangment matters, this should come last
    }
}


struct Screens_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        About()
        }
    }
}
