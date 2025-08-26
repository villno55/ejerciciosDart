import 'dart:math';

class Cancion {
  String titulo;
  String artista;
  int duracion; // segundos
  String genero;

  Cancion(this.titulo, this.artista, this.duracion, this.genero);

  @override
  String toString() => "$titulo - $artista ($genero)";
}

class Playlist {
  String nombre;
  List<Cancion> canciones = [];

  Playlist(this.nombre);

  void agregar(Cancion c) => canciones.add(c);
  void quitar(Cancion c) => canciones.remove(c);

  void reproducirAleatoria() {
    if (canciones.isEmpty) {
      print("Playlist vacía");
      return;
    }
    var rnd = Random();
    var c = canciones[rnd.nextInt(canciones.length)];
    print("🎵 Reproduciendo: $c");
  }

  int duracionTotal() => canciones.fold(0, (sum, c) => sum + c.duracion);

  void mostrarPorGenero(String g) {
    canciones.where((c) => c.genero == g).forEach(print);
  }
}

void main() {
  var lista = Playlist("Favoritas");
  lista.agregar(Cancion("Canción A", "Artista 1", 180, "rock"));
  lista.agregar(Cancion("Canción B", "Artista 2", 200, "pop"));
  lista.agregar(Cancion("Canción C", "Artista 3", 150, "rock"));

  lista.reproducirAleatoria();
  print("Duración total: ${lista.duracionTotal()} seg");

  print("Canciones de rock:");
  lista.mostrarPorGenero("rock");
}


