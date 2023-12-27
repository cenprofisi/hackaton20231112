import 'package:flutter/material.dart';
import 'package:fisiplan_app/screens/dashboard/sections/create_class.dart';
import 'package:fisiplan_app/screens/dashboard/sections/asignar_horario.dart';

class AdministradorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administrador Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de crear aula
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CrearAulaScreen()),
                );
              },
              child: Text('Crear Aula'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de asignar horarios
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AsignarHorariosScreen()),
                );
              },
              child: Text('Asignar Horarios'),
            ),
          ],
        ),
      ),
    );
  }
}



