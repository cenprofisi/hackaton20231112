import 'package:flutter/material.dart';

class ModificarScreen extends StatelessWidget {
  final String sectionTitle;

  ModificarScreen(this.sectionTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sectionTitle),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text('Contenido de $sectionTitle'),
        ),
      ),
    );
  }
}