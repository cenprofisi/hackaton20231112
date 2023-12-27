import 'package:flutter/material.dart';
import 'package:fisiplan_app/models/verify_credential.dart';
import 'package:fisiplan_app/screens/dashboard/sections/school_screen.dart';
import 'package:fisiplan_app/screens/dashboard/sections/admin_screen.dart';
import 'package:fisiplan_app/screens/dashboard/sections/vice_deanery_screen.dart';

class LoginScreen extends StatefulWidget {
  final String userType;

  LoginScreen(this.userType);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login - ${widget.userType}'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50,
                // Coloca aquí la foto del usuario si tienes una
                backgroundColor: Colors.blue,
              ),
              SizedBox(height: 16.0),
              Text(
                '¡Bienvenido al sistema de ${widget.userType}!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      _togglePasswordVisibility();
                    },
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _verifyCredentials(context);
                },
                child: Text('Iniciar Sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _verifyCredentials(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;

    // Llamada a la función para verificar credenciales
    bool isAuthenticated = await verificarCredenciales(widget.userType, email, password);

    if (isAuthenticated) {
      // Navegar a la siguiente pantalla después de la autenticación exitosa
      _navigateToDashboard(context);
    } else {
      // Mostrar un mensaje de error o tomar otra acción en caso de credenciales incorrectas
      // ...
    }
  }

  void _navigateToDashboard(BuildContext context) {
    switch (widget.userType) {
      case 'Vicedecanato':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => VicedecanatoScreen()),
        );
        break;
      case 'Escuela':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => EscuelaScreen()),
        );
        break;
      case 'Administrador':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdministradorScreen()),
        );
        break;
      default:
        // Manejar el caso por defecto, si es necesario
        break;
    }
  }
}



