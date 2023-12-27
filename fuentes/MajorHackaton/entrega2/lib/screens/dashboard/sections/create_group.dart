import 'package:flutter/material.dart';
import 'package:fisiplan_app/models/group.dart';
import 'package:fisiplan_app/models/insert_data.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
}

