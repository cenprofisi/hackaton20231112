import 'package:flutter/material.dart';
import 'package:fisiplan_app/models/classroom.dart'; 
import 'package:fisiplan_app/models/bd/insert_data.dart';

class CrearAulaScreen extends StatefulWidget {
  @override
  _CrearAulaScreenState createState() => _CrearAulaScreenState();
}

class _CrearAulaScreenState extends State<CrearAulaScreen> {
  final _formKey = GlobalKey<FormState>();
  late int _codigo;
  late String _codigoVc;
  late int _capacidad;
  late int _localCodigo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Aula'),
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
                decoration: InputDecoration(labelText: 'Código VC'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el código VC';
                  }
                  return null;
                },
                onSaved: (value) {
                  _codigoVc = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Capacidad'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la capacidad';
                  }
                  return null;
                },
                onSaved: (value) {
                  _capacidad = int.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Local Código'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el código del local';
                  }
                  return null;
                },
                onSaved: (value) {
                  _localCodigo = int.parse(value!);
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

      // Aquí puedes utilizar los valores _codigo, _codigoVc, _capacidad, _localCodigo
      // para crear una instancia de la clase Aula o realizar otras operaciones.

      // Por ejemplo:
      Aula nuevaAula = Aula(
        codigo: _codigo,
        codigoVc: _codigoVc,
        capacidad: _capacidad,
        localCodigo: _localCodigo,
      );

      DatabaseHelper.insertAula(nuevaAula);
      // Realizar acciones adicionales con la nueva aula, como enviarla a la base de datos, etc.
    }
  }
}
