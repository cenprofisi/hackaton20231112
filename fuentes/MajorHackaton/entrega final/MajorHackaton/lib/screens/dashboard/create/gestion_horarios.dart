import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GestionHorarios extends StatefulWidget {
  @override
  _GestionHorariosState createState() => _GestionHorariosState();
}

class _GestionHorariosState extends State<GestionHorarios> {
  String _selectedGroup = 'Grupo A'; // O el valor que desees como predeterminado
  String _selectedStartTime = '';
  String _selectedEndTime = '';
  bool _mostrarCalendario = false;
  List<Horario> _horarios = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Horarios'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InputForm(
                selectedGroup: _selectedGroup,
                selectedStartTime: _selectedStartTime,
                selectedEndTime: _selectedEndTime,
                mostrarCalendario: _mostrarCalendario,
                onGroupChanged: (value) {
                  setState(() {
                    _selectedGroup = value;
                  });
                },
                onStartTimeChanged: (value) {
                  setState(() {
                    _selectedStartTime = DateFormat.Hm().format(value);
                  });
                },
                onEndTimeChanged: (value) {
                  setState(() {
                    _selectedEndTime = DateFormat.Hm().format(value);
                  });
                },
                onCalendarioToggle: () {
                  setState(() {
                    _mostrarCalendario = !_mostrarCalendario;
                  });
                },
                onAgregarHorario: _agregarHorario,
              ),
              SizedBox(height: 16.0),
              HorariosSection(horarios: _horarios),
            ],
          ),
        ),
      ),
    );
  }

  void _agregarHorario() {
    if (_selectedGroup.isNotEmpty &&
        _selectedStartTime.isNotEmpty &&
        _selectedEndTime.isNotEmpty) {
      Horario nuevoHorario = Horario(
        grupo: _selectedGroup,
        horaInicio: _selectedStartTime,
        horaFin: _selectedEndTime,
      );
      setState(() {
        _horarios.add(nuevoHorario);
        _selectedGroup = '';
        _selectedStartTime = '';
        _selectedEndTime = '';
        _mostrarCalendario = false;
      });
    }
  }
}

class InputForm extends StatelessWidget {
  final String selectedGroup;
  final String selectedStartTime;
  final String selectedEndTime;
  final bool mostrarCalendario;
  final Function(String) onGroupChanged;
  final Function(DateTime) onStartTimeChanged;
  final Function(DateTime) onEndTimeChanged;
  final Function() onCalendarioToggle;
  final Function() onAgregarHorario;

  const InputForm({
    Key? key,
    required this.selectedGroup,
    required this.selectedStartTime,
    required this.selectedEndTime,
    required this.mostrarCalendario,
    required this.onGroupChanged,
    required this.onStartTimeChanged,
    required this.onEndTimeChanged,
    required this.onCalendarioToggle,
    required this.onAgregarHorario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          DropdownInput(
            label: 'Grupo',
            value: selectedGroup,
            options: ['Grupo A', 'Grupo B'],
            onChanged: onGroupChanged,
          ),
          SizedBox(height: 16.0),
          TimePickerInput(
            label: 'Hora de Inicio',
            selectedTime: selectedStartTime,
            onChanged: onStartTimeChanged,
          ),
          SizedBox(height: 16.0),
          TimePickerInput(
            label: 'Hora de Fin',
            selectedTime: selectedEndTime,
            onChanged: onEndTimeChanged,
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: onCalendarioToggle,
                style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                child: Text(
                  'Seleccionar Día',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: onAgregarHorario,
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Text(
                  'Añadir',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Container(
            height: mostrarCalendario ? 200.0 : 0.0,
            child: Visibility(
              visible: mostrarCalendario,
              child: Placeholder(),
            ),
          ),
        ],
      ),
    );
  }
}

class DropdownInput extends StatelessWidget {
  final String label;
  final String value;
  final List<String> options;
  final Function(String) onChanged;

  const DropdownInput({
    Key? key,
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      value: value,
      items: options.map((option) {
        return DropdownMenuItem(
          value: option,
          child: Text(option),
        );
      }).toList(),
      onChanged: (value) => onChanged(value.toString()),
    );
  }
}

class TimePickerInput extends StatelessWidget {
  final String label;
  final String selectedTime;
  final Function(DateTime) onChanged;

  const TimePickerInput({
    Key? key,
    required this.label,
    required this.selectedTime,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      labelText: label,
      selectedTime: selectedTime.isNotEmpty
          ? DateTime.parse('2022-01-01 $selectedTime')
          : DateTime.now(),
      onChanged: onChanged,
    );
  }
}

class HorariosSection extends StatelessWidget {
  final List<Horario> horarios;

  const HorariosSection({
    Key? key,
    required this.horarios,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Horarios',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          HorariosList(horarios: horarios),
        ],
      ),
    );
  }
}

class HorariosList extends StatelessWidget {
  final List<Horario> horarios;

  const HorariosList({
    Key? key,
    required this.horarios,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return horarios.isEmpty
        ? Center(child: Text('No hay horarios agregados'))
        : ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: horarios.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: ListTile(
                  title: Text(
                    '${horarios[index].grupo} - ${horarios[index].horaInicio} a ${horarios[index].horaFin}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          );
  }
}

class Horario {
  final String grupo;
  final String horaInicio;
  final String horaFin;

  Horario({
    required this.grupo,
    required this.horaInicio,
    required this.horaFin,
  });
}

class DateTimePicker extends StatefulWidget {
  final String labelText;
  final DateTime selectedTime;
  final Function onChanged;

  DateTimePicker({
    required this.labelText,
    required this.selectedTime,
    required this.onChanged,
  });

  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  late DateTime _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.selectedTime;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(_selectedTime),
        );
        if (picked != null && picked != _selectedTime) {
          setState(() {
            _selectedTime = DateTime(
              _selectedTime.year,
              _selectedTime.month,
              _selectedTime.day,
              picked.hour,
              picked.minute,
            );
            widget.onChanged(_selectedTime);
          });
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: widget.labelText,
          border: OutlineInputBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("${_selectedTime.hour}:${_selectedTime.minute}"),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
