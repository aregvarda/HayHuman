//
//  ChurchKeyboard.swift
//  HayHuman
//
//  Created by Геворг on 10.01.2022.
//

import SwiftUI

struct ChurchSearchBar: View {
    
    @Binding var searchChurchText: String
    @Binding var searchingChurch: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("ColorChurch"))
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search ..", text: $searchChurchText) { startedEditing in
                    if startedEditing {
                        withAnimation {
                            searchingChurch = true
                        }
                    }
                } onCommit: {
                    withAnimation {
                        searchingChurch = false
                    }
                }
            }
            .foregroundColor(.gray)
            .padding(.vertical, 10)
            .padding(.horizontal)
        }
        .background(Color.black.opacity(0.07))
        .cornerRadius(10)
        .padding(.horizontal)
        .padding(.top, 15)
    }
}


extension UIApplication {
     func dismissChurchKeyboard() {
         sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
     }
 }
