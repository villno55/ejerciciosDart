import 'dart:math';

class Ubicacion {
  String nombre;
  double lat;
  double lon;
  String categoria;
  String notas;

  Ubicacion(this.nombre, this.lat, this.lon, this.categoria, this.notas);

  double distancia(Ubicacion otra) {
    var dx = lat - otra.lat;
    var dy = lon - otra.lon;
    return sqrt(dx * dx + dy * dy); // distancia simple (no real GPS)
  }

  @override
  String toString() => "$nombre ($categoria) - $lat,$lon";
}

void main() {
  List<Ubicacion> favoritas = [];

  favoritas.add(Ubicacion("Casa", 1.2, 2.3, "casa", "Mi hogar"));
  favoritas.add(Ubicacion("Trabajo", 3.5, 4.1, "trabajo", "Oficina"));
  favoritas.add(Ubicacion("Restaurante", 5.0, 6.0, "restaurante", "Pizza"));

  print("Ubicaciones guardadas");
  favoritas.forEach((u) => print(u));

  var d = favoritas[0].distancia(favoritas[1]);
  print("Distancia entre la  Casa y el Trabajo: ${d.toStringAsFixed(2)} km");

  print("Restaurantes guardados: ");
  favoritas.where((u) => u.categoria == "restaurante").forEach(print);
}
