class Archivo {
  String nombre;
  double tamano; // MB
  String tipo;
  DateTime fecha;
  String ruta;

  Archivo(this.nombre, this.tamano, this.tipo, this.ruta)
      : fecha = DateTime.now();

  @override
  String toString() =>
      "$nombre.$tipo - ${tamano}MB - ${fecha.toLocal()} - $ruta";
}

void main() {
  List<Archivo> archivos = [];

  archivos.add(Archivo("foto1", 2.5, "jpg", "/imagenes"));
  archivos.add(Archivo("documento", 1.2, "pdf", "/docs"));
  archivos.add(Archivo("video", 15.0, "mp4", "/videos"));

  print("=== Archivos ===");
  archivos.forEach(print);

  print("PDFs:");
  archivos.where((a) => a.tipo == "pdf").forEach(print);

  double espacio = archivos.fold(0, (sum, a) => sum + a.tamano);
  print("Espacio total usado: ${espacio}MB");
}

