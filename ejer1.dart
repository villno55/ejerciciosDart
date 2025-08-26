import 'dart:io';

void main() {
  print("=== Calculadora de Propinas ===");

  stdout.write("Ingrese el valor del pedido: ");
  double pedido = double.parse(stdin.readLineSync()!);

  print("Seleccione el tipo de servicio: ");
  print("1. Comida\n2. Farmacia\n3. Supermercado");
  int tipo = int.parse(stdin.readLineSync()!);

  print("Calidad del servicio: ");
  print("1. Excelente (20%)\n2. Bueno (15%)\n3. Regular (10%)");
  int calidad = int.parse(stdin.readLineSync()!);

  double porcentaje = 0;
  String mensaje = "";

  switch (calidad) {
    case 1:
      porcentaje = 0.20;
      mensaje = "muy buen servicio ";
      break;
    case 2:
      porcentaje = 0.15;
      mensaje = "Buen servicio ";
      break;
    case 3:
      porcentaje = 0.10;
      mensaje = "Servicio regular ";
      break;
    default:
      print("Opción inválida.");
      return;
  }

  double propina = pedido * porcentaje;
  double total = pedido + propina;

  print("Propina sugerida: \$${propina.toStringAsFixed(2)}");
  print("Total a pagar: \$${total.toStringAsFixed(2)}");
  print(mensaje);
}
