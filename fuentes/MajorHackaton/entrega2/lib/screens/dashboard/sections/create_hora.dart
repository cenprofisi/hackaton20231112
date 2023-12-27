import 'package:flutter/material.dart';
import 'package:fisiplan_app/models/insert_data.dart';

class CrearHorarioScreen extends StatefulWidget {
  @override
  _CrearHorarioScreenState createState() => _CrearHorarioScreenState();
}

class _CrearHorarioScreenState extends State<CrearHorarioScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _materia;
  late String _diaSemana;
  late TimeOfDay _horaInicio;
  late TimeOfDay _horaFin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Horario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Materia'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la materia';
                  }
                  return null;
                },
                onSaved: (value) {
                  _materia = value!;
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Día de la Semana'),
                value: _diaSemana,
                items: ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes']
                    .map((dia) {
                  return DropdownMenuItem(
                    value: dia,
                    child: Text(dia),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _diaSemana = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, seleccione el día de la semana';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        final selectedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (selectedTime != null) {
                          setState(() {
                            _horaInicio = selectedTime;
                          });
                        }
                      },
                      child: Text(
                        _horaInicio != null
                            ? 'Hora de Inicio: ${_horaInicio.format(context)}'
                            : 'Seleccionar Hora de Inicio',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        final selectedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (selectedTime != null) {
                          setState(() {
                            _horaFin = selectedTime;
                          });
                        }
                      },
                      child: Text(
                        _horaFin != null
                            ? 'Hora de Fin: ${_horaFin.format(context)}'
                            : 'Seleccionar Hora de Fin',
                      ),
                    ),
                  ),
                ],
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

      // Aquí puedes utilizar los valores _materia, _diaSemana, _horaInicio, _horaFin
      // para realizar acciones adicionales, como enviarlos a la base de datos, etc.
    }
  }
}
