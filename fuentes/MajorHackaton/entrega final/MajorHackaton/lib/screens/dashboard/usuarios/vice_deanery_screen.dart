import 'package:flutter/material.dart';

class VicedecanatoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vicedecanato Dashboard'),
        actions: [
          IconButton(
            onPressed: () {
              // Lógica para activar o establecer un semestre como el semestre en curso
              // Puedes implementar un cuadro de diálogo o navegar a otra pantalla
            },
            icon: Icon(Icons.calendar_today),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Contenedor del lado izquierdo con icono de perfil y espacio para contenido
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.account_circle,
                      size: 40,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Opciones',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  // Añadir opción para aperturar el semestre
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para aperturar el semestre
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.play_arrow, size: 24),
                        SizedBox(width: 8),
                        Text('Aperturar Semestre'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Espacio para la tabla que mostrará el horario
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.assignment,
                      size: 100,
                      color: Colors.indigo,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '¡Bienvenido al Vicedecanato!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Aquí encontrarás las opciones para gestionar el semestre y más.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
