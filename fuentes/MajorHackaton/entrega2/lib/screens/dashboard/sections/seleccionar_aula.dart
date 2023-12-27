import 'package:flutter/material.dart';

class SeleccionarAulaScreen extends StatelessWidget {
  final List<String> aulas;
  final Function(String) onAulaSelected;

  SeleccionarAulaScreen({required this.aulas, required this.onAulaSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccionar Aula'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              // Puedes implementar la búsqueda aquí si es necesario
            },
            decoration: InputDecoration(
              hintText: 'Buscar aula...',
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: aulas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(aulas[index]),
                  onTap: () {
                    // Devolver el valor seleccionado a la pantalla anterior
                    Navigator.pop(context, aulas[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

