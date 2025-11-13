//
//  ContentView.swift
//  memorize
//
//  Created by Daniel Melenge Rojas on 25/02/25.
//

import SwiftUI

// MARK: - ContentView (Vista principal del juego)
struct ContentView: View {

    // MARK: - ViewModel principal del juego
    @StateObject private var viewModel = MemoryGameViewModel(
        theme: GameTheme(
            name: "Animales",
            emojis: ["🐶", "🐱", "🐭", "🐰", "🐻", "🐸", "🦊", "🐵"],
            color: .green,
            numberOfPairs: 8
        ),
        mode: .easy
    )

    // MARK: - Iconos para los temas (FIXME: mover a GameTheme)
    // TODO: Crear ThemeService para evitar duplicación de iconos.
    let petIcons = ["🫎", "🐹", "🐔", "🐠", "🐩", "🐿️", "🦌", "🐊"].shuffled() +
                   ["🫎", "🐹", "🐔", "🐠", "🐩", "🐿️", "🦌", "🐊"].shuffled()

    let flowerIcons = ["🌺", "🌹", "🌻", "🌸", "🪷", "🍁", "🌼", "🍀"].shuffled() +
                      ["🌺", "🌹", "🌻", "🌸", "🪷", "🍁", "🌼", "🍀"].shuffled()

    let weatherIcons = ["☀️", "⛅️", "☃️", "☔️", "🌪️", "❄️", "🌧️", "🌩️"].shuffled() +
                       ["☀️", "⛅️", "☃️", "☔️", "🌪️", "❄️", "🌧️", "🌩️"].shuffled()

    // MARK: - Estados UI
    @State private var themeNumber = 1
    @State private var animate = false
    @State private var showWhatsNew = false

    // MARK: - Vista PRINCIPAL
    var body: some View {
        NavigationStack {
            VStack {
                
                // MARK: - Título
                Text("Memorize!")
                    .foregroundStyle(.purple)
                    .font(.largeTitle.bold())

                // MARK: - Grid de cartas
                ScrollView {
                    if themeNumber == 1 {
                        showCard(by: petIcons, color: .green)
                    } else if themeNumber == 2 {
                        showCard(by: flowerIcons, color: .pink)
                    } else {
                        showCard(by: weatherIcons, color: .blue)
                    }
                }

                // MARK: - Barra inferior con temas
                showBottomBars
            }
            .padding()
            .onAppear { animate = true }

            // MARK: - Botón para abrir WhatsNew
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showWhatsNew = true
                    } label: {
                        Label("Qué hay de nuevo", systemImage: "info.circle.fill")
                    }
                    .tint(.purple)
                }
            }
            .sheet(isPresented: $showWhatsNew) {
                WhatsNewView() // TODO: Mejorar visualmente estilo Apple
            }
        }
    }

    // MARK: - Grid con cartas según tema seleccionado
    func showCard(by icon: [String], color: Color) -> some View {
        let shuffledIcon = icon.shuffled()

        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(0..<shuffledIcon.count, id: \.self) { index in
                CardView(content: shuffledIcon[index])
                    .aspectRatio(2.0/3.0, contentMode: .fit) // FIXED
            }
        }
        .foregroundColor(color)
    }

    // MARK: - Icono inferior para cambiar de tema
    func showBottomBar(by number: Int, symbol: String, title: String) -> some View {
        VStack {
            Button {
                themeNumber = number
            } label: {
                Image(systemName: symbol)
                    .scaleEffect(animate ? 1.2 : 1.0)
            }
            Text(title)
        }
    }

    // MARK: - Barra inferior completa
    var showBottomBars: some View {
        HStack {
            showBottomBar(by: 1, symbol: "pawprint.circle.fill", title: "Pets")
                .foregroundColor(.green)

            Spacer()

            showBottomBar(by: 2, symbol: "camera.macro.circle.fill", title: "Flowers")
                .foregroundColor(.pink)

            Spacer()

            showBottomBar(by: 3, symbol: "sun.horizon.circle.fill", title: "Weather")
                .foregroundColor(.blue)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .imageScale(.large)
        .font(.headline)
    }
}


// MARK: - CardView (Componente individual de carta)
struct CardView: View {
    let content: String
    @State private var isFaceUp: Bool = false  // TODO: Integrar con lógica real de juego

    var body: some View {
        ZStack(alignment: .center) {
            let base = RoundedRectangle(cornerRadius: 12)

            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2.0)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)

            base.opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(
            .degrees(isFaceUp ? 0 : 180),
            axis: (x: 0, y: 1, z: 0)
        )
        .onTapGesture {
            withAnimation { isFaceUp.toggle() }
        }
    }
}


// MARK: - Preview
#Preview {
    ContentView()
}
