//
//  WhatsNewView.swift
//  memorize
//
//  Created by Daniel Melenge Rojas on 13/11/25.
//

import SwiftUI

struct WhatsNewView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 32) {

                    // 🧠 Icono grande central
                    Image(systemName: "brain.head.profile")
                        .font(.system(size: 90))
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(.purple)
                        .padding(.top, 20)

                    // Título principal
                    Text("Bienvenido a Memorize")
                        .font(.largeTitle.bold())
                        .padding(.top, 4)

                    // Subtítulo
                    Text("Descubre las novedades y aprende cómo jugar este clásico juego de memoria.")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)

                    // 🔥 Tarjeta estilo Apple
                    VStack(alignment: .leading, spacing: 20) {

                        featureItem(
                            icon: "sparkles",
                            title: "Animaciones suaves",
                            description: "Las cartas giran con una animación fluida para mejorar la experiencia."
                        )

                        featureItem(
                            icon: "leaf.fill",
                            title: "Nuevos temas",
                            description: "Ahora puedes jugar con animales, flores o clima. ¡Personaliza tu experiencia!"
                        )

                        featureItem(
                            icon: "trophy.fill",
                            title: "Sistema de victoria",
                            description: "Gana al emparejar todas las cartas correctamente."
                        )

                        featureItem(
                            icon: "hand.tap.fill",
                            title: "Cómo jugar",
                            description: "Toca una carta para voltearla y encuentra su pareja idéntica para eliminarla."
                        )

                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                    .padding(.horizontal)

                    // Botón principal estilo Apple
                    Button {
                        dismiss()
                    } label: {
                        Text("Empezar a jugar")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(14)
                            .padding(.horizontal)
                            .shadow(radius: 3)
                    }
                    .padding(.bottom, 40)

                }
            }
            .navigationTitle("Qué hay de nuevo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") { dismiss() }
                        .bold()
                }
            }
        }
    }

    // MARK: - Apple Feature Item
    @ViewBuilder
    func featureItem(icon: String, title: String, description: String) -> some View {
        HStack(alignment: .top, spacing: 14) {

            Image(systemName: icon)
                .font(.system(size: 30))
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(.purple)

            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.headline)

                Text(description)
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    WhatsNewView()
}
