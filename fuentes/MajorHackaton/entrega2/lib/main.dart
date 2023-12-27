import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fisiplan_app/provider/login_provider.dart';
import 'package:fisiplan_app/screens/login/login_screen.dart';
import 'package:fisiplan_app/screens/dashboard/dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'FisiPlan',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthChecker(),
      ),
    );
  }
}

class AuthChecker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return authProvider.user == null ? LoginScreen() : DashboardScreen();
  }
}
