//
//  LottieView.swift
//  memorize
//
//  Created by Daniel Melenge Rojas on 25/11/25.
//

import SwiftUI
import Lottie

/// UIViewRepresentable wrapper para Lottie en SwiftUI
struct LottieView: UIViewRepresentable {
    let name: String
    var loopMode: LottieLoopMode = .playOnce
    var contentMode: UIView.ContentMode = .scaleAspectFit

    func makeUIView(context: Context) -> some UIView {
        let containerView = UIView(frame: .zero)

        let animation = LottieAnimation.named(name)
        let animationView = LottieAnimationView(animation: animation)
        animationView.contentMode = contentMode
        animationView.loopMode = loopMode
        animationView.translatesAutoresizingMaskIntoConstraints = false

        containerView.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            animationView.topAnchor.constraint(equalTo: containerView.topAnchor),
            animationView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])

        animationView.play { _ in
            // opcional: acciones cuando termina
        }

        return containerView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        // No-op
    }
}
