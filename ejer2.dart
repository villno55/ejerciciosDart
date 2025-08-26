import 'dart:io';

void main() {
  print(" Verificador de Contraseñas ");

  stdout.write("Ingresa una contraseña: ");
  String pass = stdin.readLineSync()!;

  bool tieneMayus = pass.contains(RegExp(r'[A-Z]'));
  bool tieneMinus = pass.contains(RegExp(r'[a-z]'));
  bool tieneNum = pass.contains(RegExp(r'[0-9]'));
  bool tieneEsp = pass.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));
  bool longitud = pass.length >= 8;

  int puntaje = 0;
  if (longitud) puntaje++;
  if (tieneMayus) puntaje++;
  if (tieneMinus) puntaje++;
  if (tieneNum) puntaje++;
  if (tieneEsp) puntaje++;

  String nivel = "";
  switch (puntaje) {
    case 1:
    case 2:
      nivel = "Débil ";
      break;
    case 3:
      nivel = "Media ";
      break;
    case 4:
      nivel = "Fuerte ";
      break;
    case 5:
      nivel = "Muy Fuerte ";
      break;
  }

  print("Nivel de seguridad: $nivel");
  if (!longitud) print(" Debe tener al menos 8 caracteres");
  if (!tieneMayus) print("Agrega mayúsculas");
  if (!tieneMinus) print(" Agrega minúsculas");
  if (!tieneNum) print(" Agrega números");
  if (!tieneEsp) print("Agrega caracteres especiales");
}
