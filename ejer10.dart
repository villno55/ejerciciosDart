class Resena {
  String usuario;
  int estrellas; // las reemolazo por numeros del 1-5
  String comentario;
  DateTime fecha;
  int utilidad; 

  Resena(this.usuario, this.estrellas, this.comentario)
      : fecha = DateTime.now(),
        utilidad = 0;

  void votarUtil() {
    utilidad++;
  }

  @override
  String toString() =>
      "$usuario: $estrellas/5 - $comentario (Utilidad: $utilidad)";
}

void main() {
  List<Resena> resennas = [];

  resennas.add(Resena("Ana", 5, "Excelente app!"));
  resennas.add(Resena("Luis", 3, "Regular"));
  resennas.add(Resena("Marta", 4, "Muy buena"));

  resennas[0].votarUtil();
  resennas[0].votarUtil();

  double promedio =
      resennas.fold(0, (s, r) => s + r.estrellas) / resennas.length;

  print("Reseñas");
  resennas.forEach(print);
  print("Promedio: ${promedio.toStringAsFixed(1)}/5 estrellas");

  print("Las más útiles:");
  resennas.sort((a, b) => b.utilidad.compareTo(a.utilidad));
  resennas.forEach(print);
}
