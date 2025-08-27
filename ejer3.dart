import 'dart:io';

void main() {
  print(" Calculadora de Tiempo de Viaje ");

  stdout.write("Distancia en km: ");
  double distancia = double.parse(stdin.readLineSync()!);

  print("ingresa el Medio de transporte: ");
  print("1. A pie\n2. Bicicleta\n3. Carro\n4. Transporte Público");
  int medio = int.parse(stdin.readLineSync()!);

  print("Hora del día: ");
  print("1. Hora pico\n2. Normal");
  int hora = int.parse(stdin.readLineSync()!);

  double velocidad = 0;
  double costo = 0;

  switch (medio) {
    case 1: velocidad = 5; break; // en 1 sola linea
    case 2: velocidad = 15; break;
    case 3: velocidad = (hora == 1) ? 20 : 40; costo = distancia * 0.5; break;
    case 4: velocidad = (hora == 1) ? 15 : 25; costo = distancia * 0.3; break;
    default: print("Opción inválida."); return;
  }

  double tiempo = distancia / velocidad * 60;

  print("Tiempo estimado: ${tiempo.toStringAsFixed(1)} minutos");
  print("Costo estimado: \$${costo.toStringAsFixed(2)}");
}
