import 'package:flutter/material.dart';
import 'package:fisiplan_app/models/group.dart';
import 'package:fisiplan_app/models/bd/insert_data.dart';

class CrearGrupoScreen extends StatefulWidget {
  @override
  _CrearGrupoScreenState createState() => _CrearGrupoScreenState();
}

class _CrearGrupoScreenState extends State<CrearGrupoScreen> {
  final _formKey = GlobalKey<FormState>();
  late int _codigo;
  late int _semestreCodigo;
  late int _cursoCodigo;
  late int _numero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Grupo'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Contenedor del lado izquierdo con el formulario
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Código'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese el código';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _codigo = int.parse(value!);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Semestre Código'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese el código del semestre';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _semestreCodigo = int.parse(value!);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Curso Código'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese el código del curso';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _cursoCodigo = int.parse(value!);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Número'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese el número del grupo';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _numero = int.parse(value!);
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      _submitForm();
                    },
                    child: Text('Guardar'),
                  ),
                ],
              ),
            ),
          ),
          // Espacio para la lista de cursos y el formulario de atributos del botón
          Expanded(
            child: Column(
              children: [
                // ComboBox para seleccionar el ciclo (Placeholder utilizado como ejemplo)
                DropdownButton<String>(
                  items: [
                    DropdownMenuItem<String>(
                      value: 'I',
                      child: Text('Ciclo I'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'II',
                      child: Text('Ciclo II'),
                    ),
                    // Agrega más elementos según sea necesario
                  ],
                  onChanged: (value) {
                    // Actualiza la lista de cursos según el ciclo seleccionado
                    // Puedes implementar la lógica necesaria aquí
                  },
                  hint: Text('Selecciona un ciclo'),
                ),
                // Lista de cursos en un contenedor bordeado con scroll
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Aquí debes mostrar dinámicamente los cursos según el ciclo seleccionado
                        Text('Curso 1'),
                        Text('Curso 2'),
                        Text('Curso 3'),
                        // Agrega más elementos según sea necesario
                      ],
                    ),
                  ),
                ),
                // Formulario de atributos del botón
                // (Placeholder utilizado como ejemplo)
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Text('Formulario de atributos del botón'),
                ),
                // Botón de guardar
                ElevatedButton(
                  onPressed: () {
                    // Lógica para guardar los atributos del botón
                    // Puedes implementar la lógica necesaria aquí
                    _showSnackBar(context, 'Atributos guardados');
                  },
                  child: Text('Guardar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Aquí puedes utilizar los valores _codigo, _semestreCodigo, _cursoCodigo, _numero
      // para crear una instancia de la clase Grupo o realizar otras operaciones.

      // Por ejemplo:
      Grupo nuevoGrupo = Grupo(
        codigo: _codigo,
        semestreCodigo: _semestreCodigo,
        cursoCodigo: _cursoCodigo,
        numero: _numero,
      );

      DatabaseHelper.insertGrupo(nuevoGrupo);

      // Realizar acciones adicionales con el nuevo grupo, como enviarlo a la base de datos, etc.
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}


