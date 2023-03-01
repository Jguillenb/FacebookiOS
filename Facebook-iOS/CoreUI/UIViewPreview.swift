//
//  UIViewPreview.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 13/01/23.
//

import Foundation
import SwiftUI
import UIKit

@available(iOS 13.0, *)
struct UIViewPreview: SwiftUI.View {
    
    private let factory: () -> UIView
    
    init(factory: @escaping () -> UIView) {
        self.factory = factory
    }
    
    var body: some SwiftUI.View {
        Renderer(factory)
    }
    
    private struct Renderer: UIViewRepresentable {
        
        private let factory: () -> UIView
        
        init(_ factory: @escaping () -> UIView) {
            self.factory = factory
        }
        
        func makeUIView(context: Context) -> UIView {
            return factory()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {
            
        }
        
    }
   
}
