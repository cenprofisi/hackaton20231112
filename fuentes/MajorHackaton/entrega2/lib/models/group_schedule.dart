class GrupoHorario {
  int codigo;
  int grupoCodigo;
  int diaCodigo;
  DateTime horaInicio;
  DateTime horaFinal;
  int aulaCodigo;
  int cursoTipoDictadoCodigo;

  GrupoHorario({
    required this.codigo,
    required this.grupoCodigo,
    required this.diaCodigo,
    required this.horaInicio,
    required this.horaFinal,
    required this.aulaCodigo,
    required this.cursoTipoDictadoCodigo,
  });
}