import SwiftUI

struct MisLibrosView: View {
    @State private var libros = Libro.ejemplos

    var body: some View {
        NavigationStack {
            List(libros) { libro in
                FilaLibro(libro: libro)
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button {
                            alternarLeido(libro)
                        } label: {
                            Label(
                                libro.estaLeido ? "Quitar" : "Leído",
                                systemImage: libro.estaLeido ? "xmark" : "checkmark"
                            )
                        }
                        .tint(libro.estaLeido ? .gray : .green)
                    }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Mis libros")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        RegistroView(libros: $libros)
                    } label: {
                        Image(systemName: "plus")
                            .accessibilityLabel("Nuevo libro")
                    }
                }
            }
        }
    }

    private func alternarLeido(_ libro: Libro) {
        if let indice = libros.firstIndex(where: { $0.id == libro.id }) {
            libros[indice].estaLeido.toggle()
        }
    }
}

#Preview {
    MisLibrosView()
}
