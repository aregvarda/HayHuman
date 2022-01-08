//
//  MenuView.swift
//  HayHuman
//
//  Created by Геворг on 06.01.2022.
//

import SwiftUI

extension View {
    func halfSheet<SheetView: View>(showSheetView: Binding<Bool>, @ViewBuilder sheetView: @escaping ()->SheetView,onEnd: @escaping ()->())-> some View {
        return self
            .background(
                HalfSheetHelper(sheetView: sheetView(), showSheetView: showSheetView, onEnd: onEnd)
            )
    }
}

struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable {
    
    var sheetView: SheetView
    @Binding var showSheetView: Bool
    
    var onEnd: ()->()
    
    let controller = UIViewController()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    func makeUIViewController(context: Context) -> UIViewController {
        controller.view.backgroundColor = .clear
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if showSheetView {
            
            let sheetController = CustomHostingController(rootView: sheetView)
            sheetController.presentationController?.delegate = context.coordinator
            uiViewController.present(sheetController, animated: true)
        } else {
            uiViewController.dismiss(animated: true)
        }
    }
    
    class Coordinator: NSObject, UISheetPresentationControllerDelegate {
        var parent: HalfSheetHelper
        
        init(parent: HalfSheetHelper) {
            self.parent = parent
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            parent.showSheetView = false
            parent.onEnd()
            
        }
    }
    
}

class CustomHostingController<Content: View>: UIHostingController<Content>{
    override func viewDidLoad() {
        view.backgroundColor = .clear
        
        if let presentationController = presentationController as? UISheetPresentationController {
            presentationController.detents = [
                .medium(),
                .large()
            ]
            
            presentationController.prefersGrabberVisible = true
        }
    }
}
