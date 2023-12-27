import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fisiplan_app/provider/login_provider.dart';
import 'package:fisiplan_app/screens/dashboard/sections/horario.dart';
import 'package:fisiplan_app/screens/dashboard/sections/crearplan.dart';
import 'package:fisiplan_app/screens/dashboard/sections/modificar.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Horarios'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HorarioScreen('Horarios')),
                );
              },
            ),
            ListTile(
              title: Text('Crear'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CrearScreen('Gestion de semestres')),
                );
              },
            ),
            ListTile(
              title: Text('Modificar'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ModificarScreen('Actualizacion de semestres')),
                );
              },
            ),
            ListTile(
              title: Text('Cerrar Sesión'),
              onTap: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text('Contenido Principal'),
        ),
      ),
    );
  }
}