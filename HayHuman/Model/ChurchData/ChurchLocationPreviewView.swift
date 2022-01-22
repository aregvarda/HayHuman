//
//  ChurchLocationPreviewView.swift
//  HayHuman
//
//  Created by Геворг on 08.01.2022.
//

import SwiftUI

struct ChurchLocationPreviewView: View {
    
    @ScaledMetric var size: CGFloat = 1
    @EnvironmentObject private var vm: ChurchLocationsViewModel
    let location: ChurchesLocations
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            
            
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
        }.padding(20)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.ultraThinMaterial)
                    .offset(y: 65)
            )
            .cornerRadius(10)
    }
}

struct ChurchLocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            ChurchLocationPreviewView(location: ChurchLocationsDataService.locations.first!)
                .padding()
        }
        .environmentObject(ChurchLocationsViewModel())
    }
}

extension ChurchLocationPreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Button {
                    vm.sheetLocation = location
                } label: {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                    
                }
            }
        }
        .padding(6)
        .background(Color(.white))
        .cornerRadius(10)
    }
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .foregroundColor(.black)
//                .font(.title2)
                .font(.system(size: 20 + size))
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            
            Text(location.cityName)
                .foregroundColor(.secondary)
                .font(.system(size: 14 + size))
                .font(.subheadline)
                .multilineTextAlignment(.leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button {
            vm.sheetLocation = location
        } label: {
            Text("Learn more")
//                .font(.headline)
                .font(.system(size: 15 + size))
                .fontWeight(.bold)
                .frame(width: 125, height: 35)
        }.buttonStyle(.borderedProminent)
    }
    private var nextButton: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
//                .font(.headline)
                .font(.system(size: 15 + size))
                .fontWeight(.bold)
                .frame(width: 125, height: 35)
        }.buttonStyle(.bordered)
    }
    
}

