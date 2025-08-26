class Usuario {
  String nombre;
  List<Cuenta> cuentas = [];
  Usuario(this.nombre);

  void agregarCuenta(Cuenta c) => cuentas.add(c);
}

class Cuenta {
  String nombre;
  double saldo;
  List<Transaccion> movimientos = [];

  Cuenta(this.nombre, this.saldo);

  void agregarTransaccion(Transaccion t) {
    movimientos.add(t);
    saldo += t.monto;
  }

  void mostrarMovimientos() {
    print("=== $nombre (Saldo: $saldo) ===");
    movimientos.forEach((m) => print(m));
  }
}

class Transaccion {
  String categoria;
  double monto;
  String descripcion;

  Transaccion(this.categoria, this.monto, this.descripcion);

  @override
  String toString() => "$categoria: $monto - $descripcion";
}

void main() {
  var usuario = Usuario("james");
  var cuenta = Cuenta("Ahorros", 1000);
  usuario.agregarCuenta(cuenta);

  cuenta.agregarTransaccion(Transaccion("Gasto", -200, "Comida"));
  cuenta.agregarTransaccion(Transaccion("Ingreso", 500, "Salario"));

  cuenta.mostrarMovimientos();
}
