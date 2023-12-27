import 'package:flutter/material.dart';
import 'package:fisiplan_app/screens/dashboard/sections/create_group.dart';
import 'package:fisiplan_app/screens/dashboard/sections/create_hora.dart';

class EscuelaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escuela Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de crear horario
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CrearHorarioScreen()),
                );
              },
              child: Text('Crear Horario'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de crear grupo
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CrearGrupoScreen()),
                );
              },
              child: Text('Crear Grupo'),
            ),
          ],
        ),
      ),
    );
  }
}


