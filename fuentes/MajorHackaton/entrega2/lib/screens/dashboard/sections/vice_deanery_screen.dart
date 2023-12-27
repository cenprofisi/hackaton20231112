import 'package:flutter/material.dart';

class VicedecanatoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vicedecanato Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '¡Bienvenido al Dashboard de Vicedecanato!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            // Coloca aquí los widgets específicos para el usuario Vicedecanato
          ],
        ),
      ),
    );
  }
}
