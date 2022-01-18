//
//  SheetController.swift
//  HayHuman
//
//  Created by Геворг on 18.01.2022.
//

import Foundation
import SwiftUI

class SheetNavigator: ObservableObject {
    
//    @Published var showSheetView = false
//    @Published var churchShowSheetView = false
    
    @Published var showSheet = false
    var sheetDestination: SheetDestination = .none {
        didSet {
            showSheet = true
        }
    }
    
    enum SheetDestination {
            case none
            case info
            case church
        }
    
    func sheetView() -> AnyView {
          switch sheetDestination {
          case .none:
              return Text("None").eraseToAnyView()
          case .info:
              return About().eraseToAnyView()
          case .church:
              return ChurchesList().eraseToAnyView()
          }
      }
    
}

extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}

protocol NavigatorProtocol: ObservableObject {
    associatedtype SheetDestination
    func sheetView() -> AnyView
}
