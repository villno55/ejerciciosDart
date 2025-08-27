import 'dart:io';

void main() {
  print("la calculadora de descuentos");//le da contexto al usuario

  stdout.write("Ingresa el valor de compra: ");
  double monto = double.parse(stdin.readLineSync()!);

  double descu = 0;
  if (monto >= 201) descu = 0.15;
  else if (monto >= 101) descu = 0.10;
  else if (monto >= 51) descu = 0.05;

  double ahorro = monto * descu;
  double subtotal = monto - ahorro;
  double iva = subtotal * 0.19;
  double total = subtotal + iva;

  print("el descuento aplicado es: ${descu * 100}%");
  print("Ahorro: \$${ahorro.toStringAsFixed(2)}");
  print("Total con IVA: \$${total.toStringAsFixed(2)}");
}
