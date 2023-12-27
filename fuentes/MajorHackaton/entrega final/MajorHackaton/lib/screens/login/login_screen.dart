import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fisiplan_app/provider/login_provider.dart';
import 'package:fisiplan_app/screens/dashboard/dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('¡Bienvenido!'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login/background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '¡Bienvenido a la Página de Horarios!',
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Aquí puedes seleccionar o crear tus horarios de manera fácil y rápida.',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  ),
                  child: Text(
                    'Acceder al Dashboard',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
