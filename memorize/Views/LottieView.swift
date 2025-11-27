//
//  LottieView.swift
//  memorize
//
//  Created by Daniel Melenge Rojas on 25/11/25.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var filename: String
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView(name: filename)
        animationView.loopMode = .playOnce
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

