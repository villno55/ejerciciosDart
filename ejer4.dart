
import 'dart:io';

void main() {
  

  stdout.write("Nombre de la red (SSID): ");
  String ssid = stdin.readLineSync()!;

  stdout.write("Contraseña: ");
  String pass = stdin.readLineSync()!;

  print("Tipo de seguridad: ");
  print("1. WPA\n2. WEP\n3. Abierta");
  int tipo = int.parse(stdin.readLineSync()!);

  String seguridad = "nopass";
  if (tipo == 1) seguridad = "WPA";
  if (tipo == 2) seguridad = "WEP";

  String qr = "WIFI:T:$seguridad;S:$ssid;P:$pass;;";
  print("Código QR generado (texto): $qr");

  if (pass.length < 8 && tipo != 3) {
    print(" Advertencia: la contraseña es poco segura");
  }

  print("Escanee este código en su dispositivo para conectarse automáticamente.");
}
