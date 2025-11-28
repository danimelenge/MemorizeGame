//
//  WhatsNewView.swift
//  memorize
//
//  Created by Daniel Melenge Rojas on 13/11/25.
//

import SwiftUI

// MARK: - Vista principal que muestra las novedades del juego
struct WhatsNewView: View {
    @Environment(\.dismiss) var dismiss // FIXME: Considerar usar un binding externo si se reutiliza la vista

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 32) {

                    // MARK: - Icono grande principal
                    Image(systemName: "brain.head.profile")
                        .font(.system(size: 90)) // FIXME: Ajustar tamaño dinámicamente si se desea accesibilidad
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(.purple)
                        .padding(.top, 20)

                    // MARK: - Título principal
                    Text("Bienvenido a Memorize")
                        .font(.largeTitle.bold())
                        .padding(.top, 4)

                    // MARK: - Subtítulo descriptivo
                    Text("Descubre las novedades y aprende cómo jugar este clásico juego de memoria.")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)

                    // MARK: - Tarjeta con características nuevas
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
                    .clipShape(RoundedRectangle(cornerRadius: 22)) // FIXME: Considerar animación al aparecer
                    .padding(.horizontal)

                    // MARK: - Botón para cerrar y empezar el juego
                    Button {
                        dismiss() // FIXME: Confirmar si debe ejecutar lógica adicional antes de cerrar
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
                    Button("Cerrar") { dismiss() } // FIXME: Podría reemplazarse por un icono para consistencia visual
                        .bold()
                }
            }
        }
    }

    // MARK: - Vista para ítems individuales de características
    @ViewBuilder
    func featureItem(icon: String, title: String, description: String) -> some View {
        HStack(alignment: .top, spacing: 14) {

            // MARK: - Icono de cada feature
            Image(systemName: icon)
                .font(.system(size: 30)) // FIXME: Adaptar a Dynamic Type
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

// MARK: - COMMIT SUGERIDO PARA GITHUB
// "Agrega comentarios, anotaciones MARK y FIXMEs a WhatsNewView para mejorar la mantenibilidad y organización del código"
