import 'package:flutter/material.dart';
import '../login/login_screen.dart';

class CrearScreen extends StatelessWidget {
  final String sectionTitle;

  CrearScreen(this.sectionTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sectionTitle),
        backgroundColor: Colors.blue, // Color de fondo de la barra de navegación
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButtonContainer(context, 'Vicedecanato', Icons.person, Colors.orange),
              _buildButtonContainer(context, 'Escuela', Icons.school, Colors.green),
              _buildButtonContainer(context, 'Administrador', Icons.admin_panel_settings, Colors.purple),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonContainer(BuildContext context, String userType, IconData iconData, Color buttonColor) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40, // Tamaño ajustado
            backgroundColor: Colors.white,
            child: Icon(
              iconData,
              size: 36, // Tamaño ajustado
              color: buttonColor,
            ),
          ),
          SizedBox(height: 12.0),
          ElevatedButton(
            onPressed: () {
              _navigateToLogin(context, userType);
            },
            style: ElevatedButton.styleFrom(
              primary: buttonColor, // Color del botón
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Text(
              userType,
              style: TextStyle(
                color: Colors.white, // Color del texto del botón
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToLogin(BuildContext context, String userType) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(userType),
      ),
    );
  }
}
