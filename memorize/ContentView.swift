//
//  ContentView.swift
//  memorize
//
//  Created by Daniel Melenge Rojas on 25/02/25.
//

import SwiftUI

struct ContentView: View {
    let petIcons = ["🫎", "🐹", "🐔", "🐠", "🐩", "🐿️", "🦌", "🐊"].shuffled() + ["🫎", "🐹", "🐔", "🐠", "🐩", "🐿️", "🦌", "🐊"].shuffled()

    let flowerIcons = ["🌺", "🌹", "🌻", "🌸", "🪷", "🍁", "🌼", "🍀"].shuffled() + ["🌺", "🌹", "🌻", "🌸", "🪷", "🍁", "🌼", "🍀"].shuffled()

    let weatherIcons = ["☀️", "⛅️", "☃️", "☔️", "🌪️", "❄️", "🌧️", "🌩️"].shuffled() + ["☀️", "⛅️", "☃️", "☔️", "🌪️", "❄️", "🌧️", "🌩️"].shuffled()
    @State var themeNumber = 1
    @State private var animate = false

    var body: some View {
        VStack {
            Text("Memorize!").foregroundStyle(Color.purple).font(.largeTitle).bold()
            ScrollView {
                if (themeNumber == 1) {
                    showCard(by: petIcons, color: .green)
                }
                else if (themeNumber == 2) {
                    showCard(by: flowerIcons, color: .pink)
                }
                else {
                    showCard(by: weatherIcons, color: .blue)
                }
            }
            showBottomBars
        }
        .padding()
        .onAppear {
            animate = true
        }
    }

    func showCard(by icon: [String], color: Color) -> some View {
        let shuffledIcon = icon.shuffled()
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(0..<shuffledIcon.count, id: \.self) { index in
                    CardView(content: shuffledIcon[index])
                        .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(color)
    }

    func showBottomBar(by number: Int, symbol: String, title: String) -> some View {
        VStack {
            Button(action: {
                themeNumber = number
            }, label: {
                Image(systemName: symbol)
                    .scaleEffect(animate ? 1.2 : 1.0)
                    .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: animate)
            })
            Text(title)
        }
    }

    var showBottomBars: some View {
        HStack {
            pets
            Spacer()
            flowers
            Spacer()
            weathers
        }
        .padding([.horizontal, .vertical], 10)
        .imageScale(.large)
        .font(.headline)
    }

    var pets: some View {
        showBottomBar(by: 1, symbol: "pawprint.circle.fill", title: "Pets").foregroundColor(.green)
    }

    var flowers: some View {
        showBottomBar(by: 2, symbol: "camera.macro.circle.fill", title: "Flowers").foregroundColor(.pink)
    }

    var weathers: some View {
        showBottomBar(by: 3, symbol: "sun.horizon.circle.fill", title: "Weather").foregroundColor(.blue)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack(alignment: .center) {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2.0)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(.degrees(isFaceUp ? 0 : 180), axis: (x: 0, y: 1, z: 0))
        .onTapGesture {
            withAnimation {
                isFaceUp.toggle()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                withAnimation {
                    isFaceUp = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
