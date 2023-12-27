import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fisiplan_app/utils/utils.dart';
import 'package:intl/intl.dart';

class HorarioScreen extends StatefulWidget {
  final String sectionTitle;

  const HorarioScreen(this.sectionTitle, {Key? key}) : super(key: key);

  @override
  _HorarioScreenState createState() => _HorarioScreenState();
}

class _HorarioScreenState extends State<HorarioScreen> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  RangeSelectionMode _rangeSelectionMode =
      RangeSelectionMode.toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  String selectedCicle = 'Ciclo 1';
  String selectedEscuela = 'Escuela de Ingeniería de Software';
  String? _current_semestre;
  Map<DateTime, List<Event>> _events = {};
  List<ProfesorData> _profesoresData = [
    ProfesorData('Sistemas Operativos','Victor Hugo Bustamante', 'Aula 101', '08:00 AM - 10:00 AM', 'Teoría'),
    ProfesorData('Programacion','Ana Maria Huayna Dueñas', 'Aula 102', '10:30 AM - 12:30 PM', 'Práctica'),
    ProfesorData('Analisis de Algoritmos','Max Saavedra', 'Aula 103', '08:00 AM - 10:00 AM', 'Teoría'),
    ProfesorData('Lenguaje','Edson Ticona', 'Aula 104', '10:30 AM - 12:30 PM', 'Práctica'),
    ProfesorData('Dart','Maria Elena Ruiz', 'Aula 105', '08:00 AM - 10:00 AM', 'Teoría'),
    ProfesorData('Base de Datos','Jorge Zavaleta', 'Aula 106', '10:30 AM - 12:30 PM', 'Práctica'),
    ProfesorData('Diseño de Software','Rosa Menendez', 'Aula 107', '08:00 AM - 10:00 AM', 'Teoría'),
    ProfesorData('Gestion de Proyectos','Lennis Wong', 'Aula 108', '10:30 AM - 12:30 PM', 'Práctica'),
    ProfesorData('Formacion de Empresa','Cesar Alcantara', 'Aula 109', '08:00 AM - 10:00 AM', 'Teoría'),
    ProfesorData('Figma','Joshua Vidal Fernandez', 'Aula 110', '10:30 AM - 12:30 PM', 'Práctica'),
    // Agregar más datos de profesores según sea necesario
  ];

  @override
  void initState() {
    super.initState();
    selectedCicle = 'Ciclo 1';
    selectedEscuela = 'Escuela de Ingeniería de Software';
    _current_semestre = '2023-2';
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    _selectedEvents.value = _getEventsForDay(DateTime.now());
    bd();
  }

  void bd() async {
    _events = await EventsCoord.getEventsByEscuelaCiclo(
        selectedEscuela, int.parse(selectedCicle.substring(6)));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null;
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _updateCalendar() {
    setState(() {
      bd();
    });
  }

  void _tapTile(Event evento) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Detalles del Curso',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Título: ${evento.title}',
                style: TextStyle(fontSize: 16),
              ),
              // Agrega aquí más detalles según la estructura de tu Evento
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cerrar',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Horarios $_current_semestre',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            onPressed: () {
              // Lógica para activar o establecer un semestre como el semestre en curso
            },
            icon: Icon(Icons.calendar_today),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: selectedCicle,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCicle = newValue!;
                });
                _updateCalendar();
              },
              items: List.generate(10, (index) => index + 1)
                  .map<DropdownMenuItem<String>>((int value) {
                return DropdownMenuItem<String>(
                  value: 'Ciclo $value',
                  child: Text(
                    'Ciclo $value',
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
              style: TextStyle(color: Colors.indigo),
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: selectedEscuela,
              onChanged: (String? newValue) {
                setState(() {
                  selectedEscuela = newValue!;
                });
                _updateCalendar();
              },
              items: <String>[
                'Escuela de Ingeniería de Software',
                'Escuela de Ingeniería de Sistemas'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
              style: TextStyle(color: Colors.indigo),
            ),
            SizedBox(height: 16.0),
            TableCalendar<Event>(
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: _focusedDay,
              calendarFormat: CalendarFormat.week,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              rangeSelectionMode: _rangeSelectionMode,
              eventLoader: _getEventsForDay,
              startingDayOfWeek: StartingDayOfWeek.monday,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                leftChevronVisible: false,
                rightChevronVisible: false,
              ),
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                weekendTextStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
              onDaySelected: _onDaySelected,
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            const SizedBox(height: 8.0),
            Text(
              'Horarios de Profesores',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 8.0),
            _buildProfesoresTable(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _updateCalendar();
        },
        child: Icon(Icons.update),
        backgroundColor: Colors.indigo,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Widget _buildProfesoresTable() {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: DataTable(
      columns: [
        DataColumn(
          label: Text('Curso', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        DataColumn(
          label: Text('Profesor', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        DataColumn(
          label: Text('Aula', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        DataColumn(
          label: Text('Horario', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        DataColumn(
          label: Text('Tipo de Clase', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
      rows: _profesoresData
          .map(
            (profesor) => DataRow(
              cells: [
                DataCell(Text(profesor.curso)),
                DataCell(Text(profesor.nombre)),
                DataCell(Text(profesor.aula)),
                DataCell(Text(profesor.horario)),
                DataCell(Text(profesor.tipoClase)),
              ],
            ),
          )
          .toList(),
    ),
  );
}
}

class ProfesorData {
  final String curso;
  final String nombre;
  final String aula;
  final String horario;
  final String tipoClase;

  ProfesorData(this.curso, this.nombre, this.aula, this.horario, this.tipoClase);
}
