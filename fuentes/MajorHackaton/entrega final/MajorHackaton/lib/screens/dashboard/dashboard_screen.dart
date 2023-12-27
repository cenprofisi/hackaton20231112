import 'package:fisiplan_app/provider/login_provider.dart';
import 'package:fisiplan_app/screens/dashboard/sections/crearplan.dart';
import 'package:fisiplan_app/screens/dashboard/sections/horario.dart';
import 'package:fisiplan_app/screens/dashboard/sections/modificar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.indigo,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.account_circle,
                      size: 60,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Bienvenido, Usuario',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(context, 'Horarios', Icons.schedule, HorarioScreen('Horarios')),
            _buildDrawerItem(context, 'Gestión de Semestres', Icons.add, CrearScreen('Gestión')),
            _buildDrawerItem(context, 'Actualización de Semestres', Icons.update, ModificarScreen('Actualización')),
            Divider(color: Colors.grey[300]),
            _buildDrawerItem(context, 'Cerrar Sesión', Icons.exit_to_app, null),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login/background.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.center,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    _buildRightContainer(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, IconData icon, Widget? screen) {
    return ListTile(
      title: Row(
        children: [
          Icon(
            icon,
            color: Colors.indigo,
            size: 24,
          ),
          SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      onTap: () {
        Navigator.pop(context);
        if (screen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        } else {
          Provider.of<AuthProvider>(context, listen: false).logout();
        }
      },
    );
  }

  Widget _buildRightContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 300.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildIconContainerWithNavigation(context, Icons.class_, 'Horarios', HorarioScreen('Horarios')),
            SizedBox(width: 250),
            _buildIconContainerWithNavigation(context, Icons.access_time, 'Gestión', CrearScreen('Gestión')),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

Widget _buildIconContainer(BuildContext context, IconData icon, String title, {double iconSize = 100, double textSize = 100}) {
  return InkWell(
    onTap: () {
      print('$title Tocado!');
    },
    child: Container(
      width: 500,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.indigo.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: iconSize,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: textSize), // Ajusta el tamaño del texto aquí
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
  Widget _buildIconContainerWithNavigation(BuildContext context, IconData icon, String title, Widget screen) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        width: 500,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.indigo.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 100, // Tamaño del icono
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20), // Tamaño del texto
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

}
