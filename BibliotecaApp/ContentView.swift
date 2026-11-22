import SwiftUI

struct ContentView: View {
    @State private var mostrarMisLibros = false

    var body: some View {
        if mostrarMisLibros {
            MisLibrosView()
        } else {
            BienvenidaView(mostrarMisLibros: $mostrarMisLibros)
        }
    }
}

#Preview {
    ContentView()
}
