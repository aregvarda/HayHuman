//
//  Constants.swift
//  HayHuman
//
//  Created by Геворг on 29.12.2021.
//

import SwiftUI

let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 16
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}

let feedback = UIImpactFeedbackGenerator(style: .medium)
