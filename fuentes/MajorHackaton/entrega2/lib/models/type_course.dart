class CursoTipoDictado {
  int codigo;
  String nombre;

  CursoTipoDictado({
    required this.codigo,
    required this.nombre,
  });
}

// curso_horasdictado.dart
class CursoHorasDictado {
  int codigo;
  int horas;
  int cursoCodigo;
  int cursoTipoDictadoCodigo;

  CursoHorasDictado({
    required this.codigo,
    required this.horas,
    required this.cursoCodigo,
    required this.cursoTipoDictadoCodigo,
  });
}