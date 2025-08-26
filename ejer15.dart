class Cliente {
  String nombre;
  Cliente(this.nombre);
}

class Prestador {
  String nombre;
  List<Servicio> servicios = [];
  Prestador(this.nombre);

  void agregarServicio(Servicio s) {
    servicios.add(s);
  }
}

class Servicio {
  String nombre;
  double precio;
  Servicio(this.nombre, this.precio);

  @override
  String toString() => "$nombre - \$${precio}";
}

class Solicitud {
  Cliente cliente;
  Prestador prestador;
  Servicio servicio;

  Solicitud(this.cliente, this.prestador, this.servicio);

  void confirmar() {
    print("${cliente.nombre} contrató ${servicio.nombre} a ${prestador.nombre}");
  }
}

void main() {
  var cliente = Cliente("Andrés");
  var prestador = Prestador("Carolina");

  var s1 = Servicio("Plomería", 50);
  var s2 = Servicio("Electricidad", 80);

  prestador.agregarServicio(s1);
  prestador.agregarServicio(s2);

  var solicitud = Solicitud(cliente, prestador, s1);
  solicitud.confirmar();
}

