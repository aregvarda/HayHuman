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
                Image("ayvazyan_back")
                    .resizable()
                    .frame(width: 900, height: 850, alignment: .center)
                    .scaledToFit()
                    .cornerRadius(15)
                    .overlay(RoundedRectangle(cornerRadius: 15).fill(Color(.gray).opacity(0.4)))
                SheetNavigation()
                
            }
            .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Text("Menu")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                    })})
            
        }
    }
}

struct MilitarySheetView: View {
    var body: some View {
            
        NavigationView {
            ZStack {
                Image("delyanov_back")
                    .resizable()
                    .frame(width: 900, height: 850, alignment: .center)
                    .scaledToFit()
                    .cornerRadius(15)
                    .overlay(RoundedRectangle(cornerRadius: 15).fill(Color(.gray).opacity(0.4)))
                SheetNavigation()
                
            }
            .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Text("Menu")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        
                    })})
            
        }
    }
}

struct ScienceSheetView: View {
    var body: some View {
            
        NavigationView {
            ZStack {
                Image("luka_back")
                    .resizable()
                    .frame(width: 900, height: 850, alignment: .center)
                    .scaledToFit()
                    .cornerRadius(15)
                    .overlay(RoundedRectangle(cornerRadius: 15).fill(Color(.gray).opacity(0.4)))
                SheetNavigation()
                
            }
            .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Text("Menu")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        
                    })})
            
        }
    }
}

struct BusinessSheetView: View {
    var body: some View {
            
        NavigationView {
            ZStack {
                Image("lazarev_back")
                    .resizable()
                    .frame(width: 900, height: 850, alignment: .center)
                    .scaledToFit()
                    .cornerRadius(15)
                    .overlay(RoundedRectangle(cornerRadius: 15).fill(Color(.gray).opacity(0.4)))
                SheetNavigation()
                
            }
            .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Text("Menu")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        
                    })})
            
        }
    }
}

struct PoliticsSheetView: View {
    var body: some View {
            
        NavigationView {
            ZStack {
                Image("loris_back")
                    .resizable()
                    .frame(width: 900, height: 850, alignment: .center)
                    .scaledToFit()
                    .cornerRadius(15)
                    .overlay(RoundedRectangle(cornerRadius: 15).fill(Color(.gray).opacity(0.4)))
                SheetNavigation()
                
            }
            .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Text("Menu")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        
                    })})
            
        }
    }
}


//About, Help, Report a Problem, List of Armenian churches

struct SheetNavigation: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            NavigationLink(destination: About()) {
                ZStack {
                    RoundedRectangle(cornerRadius: 7, style: .continuous)
                        .frame(width: 100, height: 40)
                        .cornerRadius(7)
                        .overlay(RoundedRectangle(cornerRadius: 7).fill(Color(.white)))
                HStack {
                    Image("info")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24.0, height: 24.0)
                    Text("About")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                }
                
            }
            NavigationLink(destination: Help()) {
                ZStack {
                    RoundedRectangle(cornerRadius: 7, style: .continuous)
                        .frame(width: 100, height: 40)
                        .cornerRadius(7)
                        .overlay(RoundedRectangle(cornerRadius: 7).fill(Color(.white)))
                HStack {
                    Image("question-mark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24.0, height: 24.0)
                    Text("Help")
                        .foregroundColor(.gray)
                        .font(.headline)
                        }
                }
            }
            NavigationLink(destination: Report_a_Problem()) {
                ZStack {
                    RoundedRectangle(cornerRadius: 7, style: .continuous)
                        .frame(width: 200, height: 40)
                        .cornerRadius(7)
                        .overlay(RoundedRectangle(cornerRadius: 7).fill(Color(.white)))
                HStack {
                    Image("error")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24.0, height: 24.0)
                    Text("Report a Problem")
                        .foregroundColor(.gray)
                        .font(.headline)
                        }
                }
            }
            NavigationLink(destination: ChurchesList()) {
                ZStack {
                    RoundedRectangle(cornerRadius: 7, style: .continuous)
                        .frame(width: 270, height: 40)
                        .cornerRadius(7)
                        .overlay(RoundedRectangle(cornerRadius: 7).fill(Color(.white)))
                HStack {
                    Image("church")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24.0, height: 24.0)
                    Text("List of Armenian churches")
                        .foregroundColor(.gray)
                        .font(.headline)
                        }
                }
            }
        }
    }
}

