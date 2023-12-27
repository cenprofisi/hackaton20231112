
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:fisiplan_app/provider/login_provider.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            authProvider.login('username'); // Simulamos un inicio de sesión exitoso
          },
          child: Text('Iniciar Sesión'),
        ),
      ),
    );
  }
}

