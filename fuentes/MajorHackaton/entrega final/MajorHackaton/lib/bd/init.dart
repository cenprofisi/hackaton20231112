import 'package:mysql1/mysql1.dart';
import 'package:fisiplan_app/utils/utils.dart';

class FacultadDatabase {
  static Future<MySqlConnection> getConnection() async {
    final settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: 'root',
      db: 'Hackaton2023', // Nombre de tu base de datos
    );
    return MySqlConnection.connect(settings);
  }

  static Future<Map<DateTime, List<Event>>> getHorarioByEscuelaCiclo(
      String escuela, int ciclo) async {
    MySqlConnection conn = await getConnection();
    try {
      // Ejecutar la consulta SQL para obtener eventos
      var results = await conn.query(
        """select 
            s.sem_iCodigo Semestre,
              e.esc_vcNombre Escuela,
              c.cur_vcCodigo CodigoCurso,
            c.cur_vcNombre NombreCurso,
              gh.dia_iCodigo Dia,
              g.gru_iNumero Grupo,
              a.aul_vcCodigo Aula,
              gh.gruhor_tHoraInicio Horainicio,
              gh.gruhor_tHoraFinal HoraFinal
          from grupo_horario  gh
          join grupo g on gh.gru_iCodigo = g.gru_iCodigo
          join semestre s on g.sem_iCodigo = s.sem_iCodigo
          join curso c on g.cur_iCodigo = c.cur_iCodigo
          join aula a on gh.aul_iCodigo = a.aul_iCodigo
          join plan_estudios pe on  c.plaest_iCodigo = pe.plaest_iCodigo
          join escuela e on pe.esc_iCodigo = e.esc_iCodigo
          where s.sem_iCodigo = ? and  e.esc_vcNombre = ?
          order by gh.gruhor_tHoraInicio;""",
        [ciclo, escuela],
      );

      print(results);
      // Mapear los resultados a un mapa de DateTime y List<Event>
      Map<DateTime, List<Event>> eventsMap = {};

      for (var row in results) {
        DateTime fechaActual = DateTime.now();
        int diferenciaDias = fechaActual.weekday - int.parse(row['Dia']);
        DateTime eventDate =
            fechaActual.subtract(Duration(days: diferenciaDias));
        Event event = Event(row['NombreCurso'], int.parse(row['Dia']));
        eventsMap[eventDate] = eventsMap[eventDate] ?? [];
        eventsMap[eventDate]!.add(event);
      }

      return eventsMap;
    } catch (e) {
      // Puedes propagar la excepción para que puedas ver y manejar el error específico
      throw e;
    } finally {
      await conn.close();
    }
  }
}
