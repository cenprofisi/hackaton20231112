import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';
import 'package:fisiplan_app/bd/init.dart';

/// Example event class.
class Event {
  final String title;
  int day;

  Event(this.title,this.day); //curso
  /*
  String escuela;
  String plan;
  String seccion;
  String aula;
  String horas_teoricas;
  String horas_practicas;
  String horas_laboratorio;
  
  String hora_desde;
  String hora_hasta;
  String docente;*/
  
  @override
  String toString() => title;
}

class EventsCoord {
  static Future<Map<DateTime, List<Event>>> getEventsByEscuelaCiclo(String? escuela, int? ciclo) async {
    if (escuela == null || ciclo == null) {
      return {};
    } else {
    
      Map<DateTime, List<Event>> eventos = LinkedHashMap<DateTime, List<Event>>(
        equals: isSameDay,
        hashCode: getHashCode,
      )..addAll(await FacultadDatabase.getHorarioByEscuelaCiclo(escuela,ciclo));

      return eventos;
    }
  }
}


/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}',3)))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1',0),
      Event('Today\'s Event 2',1),
      Event('Today\'s Event 1',0),
      Event('Today\'s Event 2',1),
      Event('Today\'s Event 1',0),
      Event('Today\'s Event 2',1),
      Event('Today\'s Event 1',0),
      Event('Today\'s Event 2',1),
      Event('Today\'s Event 1',0),
      Event('Today\'s Event 2',1)
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);