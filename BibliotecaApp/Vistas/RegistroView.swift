import Foundation
import SwiftUI

struct RegistroView: View {
    @Binding var libros: [Libro]
    @Environment(\.dismiss) private var dismiss

    @State private var titulo = ""
    @State private var paginas = ""
    @State private var mensajeError = ""

    var body: some View {
        Form {
            TextField("Título", text: $titulo)
            TextField("Número de páginas", text: $paginas)
                .keyboardType(.numberPad)

            if !mensajeError.isEmpty {
                Text(mensajeError)
                    .font(.footnote)
                    .foregroundStyle(.red)
            }
        }
        .navigationTitle("Nuevo libro")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Guardar", action: guardar)
            }
        }
    }

    private func guardar() {
        let tituloLimpio = titulo.trimmingCharacters(in: .whitespacesAndNewlines)
        let paginasLimpias = paginas.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !tituloLimpio.isEmpty else {
            mensajeError = "Ingresa el título del libro."
            return
        }

        guard !paginasLimpias.isEmpty else {
            mensajeError = "Ingresa el número de páginas."
            return
        }

        guard tituloLimpio.count >= 2 else {
            mensajeError = "El título debe tener al menos 2 caracteres."
            return
        }

        guard let cantidad = Int(paginasLimpias), (50...1000).contains(cantidad) else {
            mensajeError = "Las páginas deben ser un número entre 50 y 1000."
            return
        }

        libros.append(Libro(titulo: tituloLimpio, paginas: cantidad))
        dismiss()
    }
}

#Preview {
    NavigationStack {
        RegistroView(libros: .constant(Libro.ejemplos))
    }
}
