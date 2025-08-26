import 'dart:io';

void main() {
  print("la calculadora de descuentos");

  stdout.write("Ingrese monto de compra: ");
  double monto = double.parse(stdin.readLineSync()!);

  double descuento = 0;
  if (monto >= 201) descuento = 0.15;
  else if (monto >= 101) descuento = 0.10;
  else if (monto >= 51) descuento = 0.05;

  double ahorro = monto * descuento;
  double subtotal = monto - ahorro;
  double iva = subtotal * 0.19;
  double total = subtotal + iva;

  print("Descuento aplicado: ${descuento * 100}%");
  print("Ahorro: \$${ahorro.toStringAsFixed(2)}");
  print("Total con IVA: \$${total.toStringAsFixed(2)}");
}
