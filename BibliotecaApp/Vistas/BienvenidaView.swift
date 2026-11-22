import SwiftUI

struct BienvenidaView: View {
    @Binding var mostrarMisLibros: Bool

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "books.vertical.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .accessibilityHidden(true)

            Text("Biblioteca App")
                .font(.largeTitle.bold())
                .accessibilityAddTraits(.isHeader)

            Button("Ingresar") {
                mostrarMisLibros = true
            }
            .font(.headline)
            .foregroundStyle(.blue)
            .padding(.horizontal, 40)
            .padding(.vertical, 12)
            .background(.white, in: Capsule())
            .padding(.top, 16)
        }
        .foregroundStyle(.white)
        .multilineTextAlignment(.center)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.blue.ignoresSafeArea()
        }
    }
}

#Preview {
    BienvenidaView(mostrarMisLibros: .constant(false))
}
