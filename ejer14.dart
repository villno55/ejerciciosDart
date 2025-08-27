class Organizador {
  String nombre;
  Organizador(this.nombre);
}

class Evento {
  String titulo;
  String categoria;
  List<Participante> inscritos = [];

  Evento(this.titulo, this.categoria);

  void registrar(Participante p) { //no me retorna
    inscritos.add(p);
    print("${p.nombre} se registró en $titulo");
  }

  void lista() {
    print("Evento: $titulo");
    inscritos.forEach((p) => print("- ${p.nombre}"));
  }
}

class Participante {
  String nombre;
  Participante(this.nombre);
}

void main() {
  var org = Organizador("Comité Cultural");
  var evento = Evento("Festival de Música", "Cultural");

  var p1 = Participante("pacho");
  var p2 = Participante("peña");

  evento.registrar(p1);
  evento.registrar(p2);

  evento.lista();
}
