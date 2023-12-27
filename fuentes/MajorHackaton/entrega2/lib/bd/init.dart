import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:fisiplan_app/utils/utils.dart';

class EventosDatabase {
  static Future<Map<DateTime, List<Event>>> getEventsByEscuelaCiclo(String escuela, String ciclo) async {
    final settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      db: 'eventos', // Nombre de tu base de datos
    );

    final MySqlConnection conn = await MySqlConnection.connect(settings);

    try {
      // Ejecutar la consulta SQL para obtener eventos
      var results = await conn.query(
        'SELECT * FROM eventos WHERE escuela = ? AND ciclo = ?',
        [escuela, ciclo],
      );

      // Mapear los resultados a un mapa de DateTime y List<Event>
      Map<DateTime, List<Event>> eventsMap = {};

      for (var row in results) {
        DateTime eventDate = DateTime(row['dia'],DateTime.now().month, DateTime.now().year);
        Event event = Event(
          row['nombre'],
          row['dia']
        );
        if (eventsMap.containsKey(eventDate)) {
          eventsMap[eventDate]!.add(event);
        } else {
          eventsMap[eventDate] = [event];
        }
      }

      return eventsMap;
    } finally {
      await conn.close();
    }
  }
}