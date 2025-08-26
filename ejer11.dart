class Usuario {
  String nombre;
  List<Curso> cursos = [];

  Usuario(this.nombre);

  void inscribir(Curso curso) {
    cursos.add(curso);
    print("$nombre se ha inscrito en ${curso.titulo}");
  }
}

class Curso {
  String titulo;
  List<Leccion> lecciones;
  Map<Usuario, int> progreso = {};

  Curso(this.titulo, this.lecciones);

  void marcarCompletada(Usuario u) {
    if (!progreso.containsKey(u)) progreso[u] = 0;
    progreso[u] = progreso[u]! + 1;
    print("${u.nombre} completó una lección en $titulo");
  }

  double avance(Usuario u) {
    int completadas = progreso[u] ?? 0;
    return (completadas / lecciones.length) * 100;
  }
}

class Leccion {
  String titulo;
  Leccion(this.titulo);
}

void main() {
  var lecciones = [Leccion("Intro"), Leccion("Tema 1"), Leccion("Tema 2")];
  var curso = Curso("Dart Básico", lecciones);

  var ana = Usuario("Ana");
  ana.inscribir(curso);

  curso.marcarCompletada(ana);
  curso.marcarCompletada(ana);

  print("Avance de Ana en ${curso.titulo}: ${curso.avance(ana)}%");
}
