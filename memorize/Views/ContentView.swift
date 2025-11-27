//
//  ContentView.swift
//  memorize
//
//  Created by Daniel Melenge Rojas on 25/02/25.
//

import SwiftUI

// MARK: - ContentView (Vista principal del juego)
struct ContentView: View {

    @StateObject private var viewModel = MemoryGameViewModel(
        theme: GameTheme(
            name: "Animales",
            emojis: ["🐶", "🐱", "🐭", "🐰", "🐻", "🐸", "🦊", "🐵"],
            color: .green,
            numberOfPairs: 8
        ),
        mode: .easy
    )

    // MARK: - Iconos (FIXME: mover a GameTheme)
    let petIcons = ["🫎","🐹","🐔","🐠","🐩","🐿️","🦌","🐊"].shuffled() +
                   ["🫎","🐹","🐔","🐠","🐩","🐿️","🦌","🐊"].shuffled()

    let flowerIcons = ["🌺","🌹","🌻","🌸","🪷","🍁","🌼","🍀"].shuffled() +
                      ["🌺","🌹","🌻","🌸","🪷","🍁","🌼","🍀"].shuffled()

    let weatherIcons = ["☀️","⛅️","☃️","☔️","🌪️","❄️","🌧️","🌩️"].shuffled() +
                       ["☀️","⛅️","☃️","☔️","🌪️","❄️","🌧️","🌩️"].shuffled()

    // MARK: - Estados UI
    @State private var themeNumber = 1
    @State private var animate = false
    @State private var showWhatsNew = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {

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
                .padding(.top, 10)

                // MARK: - Barra inferior con temas
                showBottomBars
            }
            .padding(.horizontal)
            .onAppear { animate = true }

            // MARK: - TOOLBAR (título + botón WhatsNew)
            .toolbar {

                // ---- TÍTULO MEMORIZE EN LA TOOLBAR ----
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        Text("Memorize")
                            .font(.title3.bold())
                            .foregroundColor(.purple.opacity(0.95))

                        // (Opcional) icono decorativo
                        Image(systemName: "brain.head.profile")
                            .foregroundStyle(.purple.opacity(0.8))
                            .imageScale(.medium)
                    }
                }

                // ---- BOTÓN WHAT'S NEW ----
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showWhatsNew = true
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(.purple)
                    }
                }
            }

            .sheet(isPresented: $showWhatsNew) {
                WhatsNewView()
            }
        }
    }

    // MARK: - Grid con cartas según tema seleccionado
    func showCard(by icon: [String], color: Color) -> some View {
        let shuffledIcon = icon.shuffled()

        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(shuffledIcon.indices, id: \.self) { index in
                CardView(content: shuffledIcon[index])
                    .aspectRatio(2.0/3.0, contentMode: .fit)
            }
        }
        .foregroundColor(color)
    }

    // MARK: - Icono inferior para cambiar de tema
    func showBottomBar(by number: Int, symbol: String, title: String) -> some View {
        VStack {
            Button {
                withAnimation(.easeInOut(duration: 0.25)) {
                    themeNumber = number
                }
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
        .padding(.vertical, 10)
        .font(.headline)
        .imageScale(.large)
    }
}


// MARK: - CardView (Componente individual de carta)
struct CardView: View {
    let content: String
    @State private var isFaceUp = false

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)

            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)

            base.opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(.degrees(isFaceUp ? 0 : 180), axis: (0, 1, 0))
        .onTapGesture {
            withAnimation(.spring(response: 0.45, dampingFraction: 0.7)) {
                isFaceUp.toggle()
            }
        }
    }
}


// MARK: - Preview
#Preview {
    ContentView()
}

