//
//  Data.swift
//  HayHuman
//
//  Created by Геворг on 23.12.2021.
//

import Foundation
import SwiftUI

struct Person: Identifiable {
    var id: Int
    var image: String
    var title: String
}

var data = [
    Person(id: 0, image: "p1", title: "London"),
    Person(id: 1, image: "p2", title: "USA"),
    Person(id: 2, image: "p3", title: "Canada"),
    Person(id: 3, image: "p4", title: "Australia"),
    Person(id: 4, image: "p5", title: "Germany"),
    Person(id: 5, image: "p6", title: "Dubai"),
]
