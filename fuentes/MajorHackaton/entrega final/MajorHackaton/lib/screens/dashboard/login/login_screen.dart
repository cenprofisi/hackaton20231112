import 'package:flutter/material.dart';
import 'package:fisiplan_app/models/login/verify_credential.dart';
import 'package:fisiplan_app/screens/dashboard/usuarios/school_screen.dart';
import 'package:fisiplan_app/screens/dashboard/usuarios/admin_screen.dart';
import 'package:fisiplan_app/screens/dashboard/usuarios/vice_deanery_screen.dart';

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
    IconData userIcon;
    Color userIconColor;
    Color buttonColor;

    switch (widget.userType) {
      case 'Vicedecanato':
        userIcon = Icons.school;
        userIconColor = Colors.orange;
        buttonColor = Colors.orange;
        break;
      case 'Escuela':
        userIcon = Icons.account_balance;
        userIconColor = Colors.green;
        buttonColor = Colors.green;
        break;
      case 'Administrador':
        userIcon = Icons.admin_panel_settings;
        userIconColor = Colors.purple;
        buttonColor = Colors.purple;
        break;
      default:
        userIcon = Icons.person;
        userIconColor = Colors.blue;
        buttonColor = Colors.blue;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Login - ${widget.userType}'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 400,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: userIconColor,
                  child: Icon(
                    userIcon,
                    size: 60,
                    color: Colors.white,
                  ),
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _verifyCredentials(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: buttonColor, // background color
                    ),
                    child: Text(
                      'Iniciar Sesión',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
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

    bool isAuthenticated =
        await verificarCredenciales(widget.userType, email, password);

    if (isAuthenticated) {
      _navigateToDashboard(context);
    } else {
      // Manejar credenciales incorrectas
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
