class Usuario {
  String nombre;
  List<Curso> cursos = [];

  Usuario(this.nombre);

  void inscribir(Curso curso) {
    cursos.add(curso);
    curso.progresos[this] = Progreso(this, curso); 
    print("$nombre se ha inscrito en ${curso.titulo}");
  }
}

class Curso {
  String titulo;
  List<Leccion> lecciones;
  Map<Usuario, Progreso> progresos = {};

  Curso(this.titulo, this.lecciones);

  void marcarCompletada(Usuario u) {
    if (!progresos.containsKey(u)) {
      progresos[u] = Progreso(u, this);
    }
    progresos[u]!.completarLeccion();
    print("${u.nombre} completó una lección en $titulo");
  }

  double avance(Usuario u) {
    if (!progresos.containsKey(u)) return 0.0;
    return progresos[u]!.porcentaje();
  }
}

class Leccion {
  String titulo;
  Leccion(this.titulo);
}

class Progreso {
  Usuario usuario;
  Curso curso;
  int completadas = 0;

  Progreso(this.usuario, this.curso);

  void completarLeccion() {
    if (completadas < curso.lecciones.length) {
      completadas++;
    }
  }

  double porcentaje() {
    return (completadas / curso.lecciones.length) * 100;
  }

  @override
  String toString() =>
      "Progreso de ${usuario.nombre}: $completadas/${curso.lecciones.length} (${porcentaje().toStringAsFixed(1)}%)";
}

void main() {
  var lecciones = [Leccion("Intro"), Leccion("Tema 1"), Leccion("Tema 2")];
  var curso = Curso("Dart Básico", lecciones);

  var vlacho = Usuario("vlacho"); //ingreso usuario
  vlacho.inscribir(curso);

  curso.marcarCompletada(vlacho);
  curso.marcarCompletada(vlacho);

  print(curso.progresos[vlacho]); 
  print("Avance de vlacho en ${curso.titulo}: ${curso.avance(vlacho)}%");
}




