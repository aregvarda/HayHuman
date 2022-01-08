//
//  SheetView.swift
//  HayHuman
//
//  Created by Геворг on 07.01.2022.
//

import SwiftUI
import Foundation

struct CultureSheetView: View {
    var body: some View {
            
        NavigationView {
            ZStack {
                Color(.white)
                SheetNavigation()
                
            }
            .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Text("Menu")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.black)
                    })})
            
        }.mask(Color.black.opacity(0.9))
    }
}

struct MilitarySheetView: View {
    var body: some View {
            
        NavigationView {
            ZStack {
                Color(.white)
                SheetNavigation()
                
            }
            .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Text("Menu")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.black)
                        
                    })})
            
        }.mask(Color.black.opacity(0.9))
    }
}

struct ScienceSheetView: View {
    var body: some View {
            
        NavigationView {
            ZStack {
                Color(.white)
                SheetNavigation()
                
            }
            .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Text("Menu")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.black)
                    })})
            
        }.mask(Color.black.opacity(0.9))
    }
}

struct BusinessSheetView: View {
    var body: some View {
            
        NavigationView {
            ZStack {
                Color(.white)
                SheetNavigation()
                
            }
            .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Text("Menu")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.black)
                        
                    })})
            
        }.mask(Color.black.opacity(0.9))
    }
}

struct PoliticsSheetView: View {
    var body: some View {
            
        NavigationView {
            ZStack {
                Color(.white)
                SheetNavigation()
                
            }
            .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Text("Menu")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.black)
                        
                    })})
            
        }.mask(Color.black.opacity(0.9))
    }
}


//About, Help, Report a Problem, List of Armenian churches

struct SheetNavigation: View {
    var body: some View {
        ZStack {

            VStack(alignment: .leading, spacing: 30) {
            NavigationLink(destination: About()) {
                    HStack {
                    Image(systemName: "info.circle")
                            .foregroundColor(.black)
                    Text("Info")
                        .foregroundColor(.black)
                        .font(.title2).fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        
                }
                }
                

            NavigationLink(destination: Help()) {
                HStack {
                    Image(systemName: "questionmark.circle")
                        .foregroundColor(.black)
                    Text("Help")
                        .foregroundColor(.black)
                        .font(.title2).fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        }

            }
            NavigationLink(destination: Report_a_Problem()) {
                HStack {
                    Image(systemName: "exclamationmark.circle")
                        .foregroundColor(.black)
                    Text("Report a Problem")
                        .foregroundColor(.black)
                        .font(.title2).fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        }

            }
            NavigationLink(destination: ChurchesList()) {

                HStack {
                    Image(systemName: "map")
                        .foregroundColor(.black)
                    Text("Armenian churches")
                        .foregroundColor(.black)
                        .font(.title2).fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        }
                }
            }
        }
    }
}


