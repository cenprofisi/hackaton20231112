import '../faculty.dart';
import '../classroom.dart';
import 'mysql.dart';
import '../school.dart';
import '../academic_area.dart';
import '../course.dart';
import '../curriculum.dart';
import '../day.dart';
import '../equivalent_course.dart';
import '../formative_area_course.dart';
import '../group_schedule.dart';
import '../group.dart';
import '../local.dart';
import '../prerequisite_course.dart';
import '../semester.dart';
import '../type_course.dart';

class DatabaseHelper {
  static Future<void> insertAreaAcademica(AreaAcademica areaAcademica) async {
    var mysql = Mysql();
    var connection = await mysql.getConection();

    try {
      await connection.query(
          'INSERT INTO area_academica (areaca_iCodigo, areaca_vcCodigo, areaca_vcNombre, areaca_bActivo) VALUES (?, ?, ?, ?)',
          [
            areaAcademica.codigo,
            areaAcademica.codigoVc,
            areaAcademica.nombre,
            areaAcademica.activo
          ]);
    } finally {
      await connection.close();
    }
  }

  static Future<void> insertAula(Aula aula) async {
    var mysql = Mysql();
    var connection = await mysql.getConection();

    try {
      await connection.query(
        'INSERT INTO aula (aul_iCodigo, aul_vcCodigo, aul_iCapacidad, loc_iCodigo) VALUES (?, ?, ?, ?)',
        [aula.codigo, aula.codigoVc, aula.capacidad, aula.localCodigo],
      );
    } finally {
      await connection.close();
    }
  }

  static Future<void> insertCurso(Curso curso) async {
    var mysql = Mysql();
    var connection = await mysql.getConection();

    try {
      await connection.query(
        'INSERT INTO curso (cur_iCodigo, cur_vcCodigo, cur_vcNombre, cur_fCreditos, cur_fCreditosRequisito, cur_iSemestre, plaest_iCodigo, curtip_iCodigo, curare_iCodigo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [
          curso.codigo,
          curso.codigoVc,
          curso.nombre,
          curso.creditos,
          curso.creditosRequisito,
          curso.semestre,
          curso.planEstudiosCodigo,
          curso.cursoTipoCodigo,
          curso.cursoAreaFormativaCodigo
        ],
      );
    } finally {
      await connection.close();
    }
  }

  static Future<void> insertPlanEstudios(PlanEstudios planEstudios) async {
    var mysql = Mysql();
    var connection = await mysql.getConection();

    try {
      await connection.query(
        'INSERT INTO plan_estudios (plaest_iCodigo, plaest_vcCodigo, plaest_vcRR, plaest_dVigencia, plaest_iCreditos, plaest_bActivo, esc_iCodigo) VALUES (?, ?, ?, ?, ?, ?, ?)',
        [
          planEstudios.codigo,
          planEstudios.codigoVc,
          planEstudios.rr,
          planEstudios.vigencia,
          planEstudios.creditos,
          planEstudios.activo ? 1 : 0,
          planEstudios.escuelaCodigo
        ],
      );
    } finally {
      await connection.close();
    }
  }

  static Future<void> insertDia(Dia dia) async {
    var mysql = Mysql();
    var connection = await mysql.getConection();

    try {
      await connection.query(
        'INSERT INTO dia (dia_iCodigo, dia_iNumero, dia_vcNombre) VALUES (?, ?, ?)',
        [dia.codigo, dia.numero, dia.nombre],
      );
    } finally {
      await connection.close();
    }
  }

  static Future<void> insertCursoEquivalente(
      CursoEquivalente cursoEquivalente) async {
    var mysql = Mysql();
    var connection = await mysql.getConection();

    try {
      await connection.query(
        'INSERT INTO curso_equivalente (cureqi_iCodigo, cur_iCodigo, equ_iCodigo) VALUES (?, ?, ?)',
        [
          cursoEquivalente.codigo,
          cursoEquivalente.cursoCodigo,
          cursoEquivalente.equivalenteCodigo
        ],
      );
    } finally {
      await connection.close();
    }
  }

  static Future<void> insertFacultad(Facultad facultad) async {
    var mysql = Mysql();
    var connection = await mysql.getConection();

    try {
      await connection.query(
        'INSERT INTO facultad (fac_iCodigo, fac_vcCodigo, fac_vcNombre) VALUES (?, ?, ?)',
        [facultad.codigo, facultad.codigoVc, facultad.nombre],
      );
    } finally {
      await connection.close();
    }
  }

  static Future<void> insertCursoAreaFormativa(
      CursoAreaFormativa cursoAreaFormativa) async {
    var mysql = Mysql();
    var connection = await mysql.getConection();

    try {
      await connection.query(
        'INSERT INTO curso_areaformativa (curare_iCodigo, curare_vcNombre) VALUES (?, ?)',
        [cursoAreaFormativa.codigo, cursoAreaFormativa.nombre],
      );
    } finally {
      await connection.close();
    }
  }

  static Future<void> insertGrupoHorario(GrupoHorario grupoHorario) async {
    var mysql = Mysql();
    var connection = await mysql.getConection();

    try {
      await connection.query(
        'INSERT INTO grupo_horario (gruhor_iCodigo, gru_iCodigo, dia_iCodigo, gruhor_tHoraInicio, gruhor_tHoraFinal, aul_iCodigo, curtip_iCodigo) VALUES (?, ?, ?, ?, ?, ?, ?)',
        [
          grupoHorario.codigo,
          grupoHorario.grupoCodigo,
          grupoHorario.diaCodigo,
          grupoHorario.horaInicio,
          grupoHorario.horaFinal,
          grupoHorario.aulaCodigo,
          grupoHorario.cursoTipoDictadoCodigo
        ],
      );
    } finally {
      await connection.close();
    }
  }

  static Future<void> insertGrupo(Grupo grupo) async {
    var db = new Mysql();

   try {
    var connection = await db.getConection();

    await connection.query(
      'INSERT INTO grupo (gru_iCodigo, sem_iCodigo, cur_iCodigo, gru_iNumero) VALUES (?, ?, ?, ?)',
      [grupo.codigo, grupo.semestreCodigo, grupo.cursoCodigo, grupo.numero],
    );

    await connection.close();
    } catch (e) {
      print('Error al insertar en la base de datos: $e');
    }

  }

  static Future<void> insertLocales(Locales locales) async {
    var mysql = Mysql();
    var connection = await mysql.getConection();

    try {
      await connection.query(
        'INSERT INTO locales (loc_iCodigo, loc_vcCodigo, loc_vcNombre) VALUES (?, ?, ?)',
        [locales.codigo, locales.codigoVc, locales.nombre],
      );
    } finally {
      await connection.close();
    }
  }

  static Future<void> insertCursoPrerequisito(
      CursoPrerequisito cursoPrerequisito) async {
    var mysql = Mysql();
    var connection = await mysql.getConection();

    try {
      await connection.query(
        'INSERT INTO curso_prerequisito (curpre_iCodigo, cur_iCodigo, req_iCodigo) VALUES (?, ?, ?)',
        [
          cursoPrerequisito.codigo,
          cursoPrerequisito.cursoCodigo,
          cursoPrerequisito.requisitoCodigo
        ],
      );
    } finally {
      await connection.close();
    }
  }

  static Future<void> insertEscuela(Escuela escuela) async {
    var mysql = Mysql();
    var connection = await mysql.getConection();

    try {
      await connection.query(
        'INSERT INTO escuela (esc_iCodigo, esc_vcCodigo, esc_vcNombre, esc_bActivo, fac_iCodigo, areaca_iCodigo) VALUES (?, ?, ?, ?, ?, ?)',
        [
          escuela.codigo,
          escuela.codigoVc,
          escuela.nombre,
          escuela.activo ? 1 : 0,
          escuela.facultadCodigo,
          escuela.areaAcademicaCodigo
        ],
      );
    } finally {
      await connection.close();
    }
  }

  static Future<void> insertSemestre(Semestre semestre) async {
    var mysql = Mysql();
    var connection = await mysql.getConection();

    try {
      await connection.query(
        'INSERT INTO semestre (sem_iCodigo, sem_vcCodigo, sem_cActivo) VALUES (?, ?, ?)',
        [semestre.codigo, semestre.codigoVc, semestre.activo],
      );
    } finally {
      await connection.close();
    }
  }

  static Future<void> insertCursoTipoDictado(
      CursoTipoDictado cursoTipoDictado) async {
    var mysql = Mysql();
    var connection = await mysql.getConection();

    try {
      await connection.query(
        'INSERT INTO curso_tipodictado (curtip_iCodigo, curtip_vcNombre) VALUES (?, ?)',
        [cursoTipoDictado.codigo, cursoTipoDictado.nombre],
      );
    } finally {
      await connection.close();
    }
  }

  static Future<void> insertCursoHorasDictado(
      CursoHorasDictado cursoHorasDictado) async {
    var mysql = Mysql();
    var connection = await mysql.getConection();

    try {
      await connection.query(
        'INSERT INTO curso_horasdictado (curhor_iCodigo, curhor_iHoras, cur_iCodigo, curtip_iCodigo) VALUES (?, ?, ?, ?)',
        [
          cursoHorasDictado.codigo,
          cursoHorasDictado.horas,
          cursoHorasDictado.cursoCodigo,
          cursoHorasDictado.cursoTipoDictadoCodigo
        ],
      );
    } finally {
      await connection.close();
    }
  }
}
