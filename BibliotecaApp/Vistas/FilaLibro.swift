import SwiftUI

struct FilaLibro: View {
    let libro: Libro

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "book")
                .font(.title2)
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 2) {
                Text(libro.titulo)
                    .font(.headline)
                Text("\(libro.paginas) páginas")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            if libro.estaLeido {
                Image(systemName: "checkmark")
                    .fontWeight(.semibold)
                    .foregroundStyle(.green)
                    .accessibilityLabel("Leído")
            }
        }
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    List(Libro.ejemplos) { libro in
        FilaLibro(libro: libro)
    }
}
