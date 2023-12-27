class PlanEstudios {
  int codigo;
  String codigoVc;
  String rr;
  DateTime? vigencia;
  int creditos;
  bool activo;
  int escuelaCodigo;

  PlanEstudios({
    required this.codigo,
    required this.codigoVc,
    required this.rr,
    this.vigencia,
    required this.creditos,
    required this.activo,
    required this.escuelaCodigo,
  });
}