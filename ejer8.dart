import 'dart:math';

class Cancion {
  String titulo;
  String artista;
  double duracion; 
  String genero;
  int calificacion; //de 1 a 5

  int vecesReproducida = 0; 

  Cancion(this.titulo, this.artista, this.duracion, this.genero, this.calificacion);

  void reproducir() {
    vecesReproducida++;
    print("Reproduciendo: $titulo - $artista ($duracion min) Calificación: $calificacion");
  }

  @override
  String toString() {
    return "$titulo - $artista | $genero | ${duracion}min | Calificación: $calificacion";
  }
}

class Playlist {
  String nombre;
  List<Cancion> canciones = [];

  Playlist(this.nombre);

  void agregarCancion(Cancion c) {
    canciones.add(c);
    print("Canción '${c.titulo}' agregada a la playlist.");
  }

  void quitarCancion(String titulo) {
    canciones.removeWhere((c) => c.titulo == titulo);
    print("Canción '$titulo' eliminada de la playlist.");
  }

  void reproducirAleatoria() {
    if (canciones.isEmpty) {
      print("La playlist o tiene canciones.");
      return;
    }
    var random = Random();
    var c = canciones[random.nextInt(canciones.length)];
    c.reproducir();
  }

  double duracionTotal() {
    return canciones.fold(0, (suma, c) => suma + c.duracion);
  }

  List<Cancion> filtrarPorGenero(String genero) {
    return canciones.where((c) => c.genero == genero).toList();
  }

  void mostrarEstadisticas() {
    print("Estadísticas de la Playlist '$nombre':");
    if (canciones.isEmpty) {
      print("   (No hay canciones todavía)");
      return;
    }

    for (var c in canciones) {
      print("   ${c.titulo}: reproducida ${c.vecesReproducida} veces | Calificación: ${c.calificacion}");
    }

    var promedio = canciones.map((c) => c.calificacion).reduce((a, b) => a + b) / canciones.length;
    print("   Calificación promedio: ${promedio.toStringAsFixed(2)}");
    print("   Duración total: ${duracionTotal().toStringAsFixed(2)} min");
  }
}

void main() {
  var miPlaylist = Playlist("Salsa");

  //las canciones
  var c1 = Cancion("Ya no regreso contigo", "Roberto Blades", 4.5, "Salsa", 5);
  var c2 = Cancion("Si no fueras de él", "Rubén Sierra", 4.2, "Salsa", 4);
  var c3 = Cancion("Lejos de ti", "Ángel Canales", 5.1, "Salsa", 5);
  var c4 = Cancion("Hace tiempo", "Ángel Canales", 4.8, "Salsa", 5);
  var c5 = Cancion("Te voy a dejar", "Luigi Texidor", 4.6, "Salsa", 4);

  
  miPlaylist.agregarCancion(c1);
  miPlaylist.agregarCancion(c2);
  miPlaylist.agregarCancion(c3);
  miPlaylist.agregarCancion(c4);
  miPlaylist.agregarCancion(c5);

  print("\nCanciones en la playlist:");
  miPlaylist.canciones.forEach(print);

  print("\nReproducción aleatoria:");
  miPlaylist.reproducirAleatoria();
  miPlaylist.reproducirAleatoria();

  print("\nCanciones de Ángel Canales:");
  miPlaylist.filtrarPorGenero("Salsa").where((c) => c.artista == "Ángel Canales").forEach(print);

  print("\nEstadísticas:");
  miPlaylist.mostrarEstadisticas();

  print("\nDuración total de la playlist: ${miPlaylist.duracionTotal().toStringAsFixed(2)} min");
}
