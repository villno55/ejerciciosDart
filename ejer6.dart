class Notificacion {
  String titulo;
  String mensaje;
  String tipo; 
  DateTime fecha;
  bool leida;

  Notificacion(this.titulo, this.mensaje, this.tipo)
      : fecha = DateTime.now(),
        leida = false;

  void marcarLeida() {
    leida = true;
  }

  @override
  String toString() {
    return "[$tipo] $titulo - $mensaje (${leida ? "Leída" : "No leída"})";
  }
}

void main() {
  List<Notificacion> lista = [];

  lista.add(Notificacion("Bienvenido", "Tu cuenta ha sido creada", "info"));
  lista.add(Notificacion("Aviso", "Tu plan vence pronto", "advertencia"));
  lista.add(Notificacion("Error", "Contraseña incorrecta", "error"));

  lista[1].marcarLeida();

  print("Notificaciones");
  for (var n in lista) {
    print(n);
  }

  int leidas = lista.where((n) => n.leida).length;
  print("Leídas: $leidas / ${lista.length}");
}
