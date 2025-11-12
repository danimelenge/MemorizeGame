//
//  ModeSelectionView.swift
//  memorize
//
//  Created by Daniel Melenge Rojas on 12/11/25.
//


import SwiftUI

struct ModeSelectionView: View {
    @ObservedObject var viewModel: MemoryGameViewModel

    var body: some View {
        VStack {
            Text("Selecciona dificultad")
                .font(.headline)
                .padding(.bottom, 10)

            Picker("Modo de juego", selection: $viewModel.currentMode) {
                ForEach(GameMode.allCases) { mode in
                    Text(mode.displayName.capitalized)
                        .tag(mode)
                }
            }
            .pickerStyle(.segmented)
            .padding()

            Button("Aplicar dificultad") {
                viewModel.changeMode(to: viewModel.currentMode)
            }
            .buttonStyle(.borderedProminent)
            .tint(.purple)
        }
        .padding()
    }
}

#Preview {
    ModeSelectionView(
        viewModel: MemoryGameViewModel(
            theme: GameTheme(
                name: "Animales",
                emojis: ["🐶", "🐱", "🐭", "🐰", "🐻"],
                color: .green,          // ✅ CORREGIDO: Color, no String
                numberOfPairs: 5        // ✅ Completa el valor
            ),
            mode: .easy
        )
    )
}


