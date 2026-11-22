import Foundation

struct Libro: Identifiable {
    let id = UUID()
    var titulo: String
    var paginas: Int
    var estaLeido: Bool = false

    static let ejemplos: [Libro] = [
        Libro(titulo: "Cien años de soledad", paginas: 471, estaLeido: true),
        Libro(titulo: "El principito", paginas: 96),
        Libro(titulo: "Don Quijote", paginas: 863, estaLeido: true),
        Libro(titulo: "La ciudad y los perros", paginas: 408)
    ]
}
