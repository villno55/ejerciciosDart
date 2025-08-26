import 'dart:io';

void main() {
  print(" Calculadora de Propinas ");

  stdout.write("Ingresa el valor del pedido: ");
  double pedido = double.parse(stdin.readLineSync()!);

  print("Selecciona el tipo de servicio: ");
  print("1. Comida\n2. Farmacia\n3. Supermercado");
  int tipo = int.parse(stdin.readLineSync()!);

  print("Que te parecio el servicio: ");
  print("1. Excelente (20%)\n2. Bueno (15%)\n3. Regular (10%)");
  int calidad = int.parse(stdin.readLineSync()!);

  double porcentaje = 0;
  String mensaje = "";

  switch (calidad) { // me permite tener mas opciones, segun lo q elija el usuario se va a mostar un mensaje
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
      mensaje = "Servicio regula, esperamos mejorar cada vez mas  ";
      break;
    default:
      print("Opción inválida.");
      return;
  }

  double propina = pedido * porcentaje;
  double total = pedido + propina;

  print("Propina sugerida: \$${propina.toStringAsFixed(2)}");
  print("cuenta total: \$${total.toStringAsFixed(2)}");
  print(mensaje);
}
