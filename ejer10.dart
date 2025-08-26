class Resena {
  String usuario;
  int estrellas; // 1-5
  String comentario;
  DateTime fecha;
  int utilidad; // votos útiles

  Resena(this.usuario, this.estrellas, this.comentario)
      : fecha = DateTime.now(),
        utilidad = 0;

  void votarUtil() {
    utilidad++;
  }

  @override
  String toString() =>
      "$usuario: ${"" * estrellas} - $comentario (Utilidad: $utilidad)";
}

void main() {
  List<Resena> reseñas = [];
  // la declaro resena ya q no admite la ñ,  
  reseñas.add(Resena("Ana", 5, "Excelente app!"));
  reseñas.add(Resena("Luis", 3, "Regular"));
  reseñas.add(Resena("Marta", 4, "Muy buena"));

  reseñas[0].votarUtil();
  reseñas[0].votarUtil();

  double promedio =
      reseñas.fold(0, (s, r) => s + r.estrellas) / reseñas.length;

  print("Reseñas ");
  reseñas.forEach(print);
  print("Promedio: ${promedio.toStringAsFixed(1)} estrellas");

  print("Las más útiles: ");
  reseñas.sort((a, b) => b.utilidad.compareTo(a.utilidad));
  reseñas.forEach(print);
}



