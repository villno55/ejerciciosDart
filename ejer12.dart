class Usuario {
  String nombre;
  List<Libro> libros = [];
  Usuario(this.nombre);

  void publicar(Libro libro) {
    libros.add(libro);
    print("$nombre publicó ${libro.titulo}");
  }
}

class Libro {
  String titulo;
  String autor;
  bool dispo = true;

  Libro(this.titulo, this.autor);

  @override
  String toString() => "$titulo - $autor (${dispo ? "Disponible" : "Intercambiado"})";
}

class Intercambio {
  Usuario de;
  Usuario para;
  Libro libro;

  Intercambio(this.de, this.para, this.libro) {
    libro.dispo = false;
  }

  @override
  String toString() => "${de.nombre} → ${para.nombre}: ${libro.titulo}";
}

void main() {
  var pacho = Usuario("pacho");
  var chacha = Usuario("chacha");

  var libro1 = Libro("el resplandor", "sthepen king");
  pacho.publicar(libro1);

  var intercambio = Intercambio(pacho, chacha, libro1);
  print("Intercambio realizado: $intercambio");

  print("Estado libro: ${libro1}");
}
