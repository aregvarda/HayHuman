//
//  ViewRouter.swift
//  HayHuman
//
//  Created by Геворг on 23.12.2021.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .culture
}

enum Page {
     case culture
     case military
     case science
     case politics
     case business
 }
