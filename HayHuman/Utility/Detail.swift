//
//  Detail.swift
//  HayHuman
//
//  Created by Геворг on 29.12.2021.
//

import Foundation

class BusinessDetail: ObservableObject {
    
    @Published var showingBusinessProfile: Bool = false
    @Published var selectedBusinessProfile: CardBusiness? = nil
}


class CultureDetail: ObservableObject {
    
    @Published var showingCultureProfile: Bool = false
    @Published var selectedCultureProfile: CultureCard? = nil
}

class PoliticsDetail: ObservableObject {
    
    @Published var showingPoliticsProfile: Bool = false
    @Published var selectedPoliticsProfile: CardPolitics? = nil
}
