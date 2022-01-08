//
//  Report a Problem.swift
//  HayHuman
//
//  Created by Геворг on 07.01.2022.
//

import SwiftUI

struct Report_a_Problem: View {
    var body: some View{
        Text("Welcome to the Leaderbaord Page!")
            .navigationBarTitle("Report a Problem")
            .frame(maxWidth:.infinity,maxHeight: .infinity)
    }
}

struct Report_a_Problem_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        Report_a_Problem()
        }
    }
}
