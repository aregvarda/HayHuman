//
//  Bundle.swift
//  HayHuman
//
//  Created by Геворг on 29.12.2021.
//

import Foundation
import SwiftUI
import CoreLocation

extension Bundle {
    
    func decode<T>(_ file: String) -> T where T: Codable {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        return decodedData
    }
    
}
