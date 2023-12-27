class Curso {
  int codigo;
  String codigoVc;
  String nombre;
  double creditos;
  double creditosRequisito;
  int semestre;
  int planEstudiosCodigo;
  int cursoTipoCodigo;
  int cursoAreaFormativaCodigo;

  Curso({
    required this.codigo,
    required this.codigoVc,
    required this.nombre,
    required this.creditos,
    required this.creditosRequisito,
    required this.semestre,
    required this.planEstudiosCodigo,
    required this.cursoTipoCodigo,
    required this.cursoAreaFormativaCodigo,
  });
}