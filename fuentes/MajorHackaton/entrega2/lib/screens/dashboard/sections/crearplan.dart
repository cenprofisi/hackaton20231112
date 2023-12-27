import 'package:flutter/material.dart';
import 'login_screen.dart';

class CrearScreen extends StatelessWidget {
  final String sectionTitle;

  CrearScreen(this.sectionTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sectionTitle),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    _navigateToLogin(context, 'Vicedecanato');
                  },
                  child: Text('Vicedecanato'),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    _navigateToLogin(context, 'Escuela');
                  },
                  child: Text('Escuela'),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    _navigateToLogin(context, 'Administrador');
                  },
                  child: Text('Administrador'),
                ),
              ),
            ],
          ),
        ),
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