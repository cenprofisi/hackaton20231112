import 'package:flutter/material.dart';

class SeleccionarGrupoScreen extends StatelessWidget {
  final List<String> grupos;
  final Function(String) onGrupoSelected;

  SeleccionarGrupoScreen({required this.grupos, required this.onGrupoSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccionar Grupo'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              // Puedes implementar la búsqueda aquí si es necesario
            },
            decoration: InputDecoration(
              hintText: 'Buscar grupo...',
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: grupos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(grupos[index]),
                  onTap: () {
                    // Devolver el valor seleccionado a la pantalla anterior
                    Navigator.pop(context, grupos[index]);
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



