import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fisiplan_app/utils/utils.dart';
import 'package:intl/intl.dart';

class HorarioScreen extends StatefulWidget {
  final String sectionTitle;
  
  const HorarioScreen(this.sectionTitle, {super.key});

  @override
  _HorarioScreenState createState() => _HorarioScreenState();
}

class _HorarioScreenState  extends State<HorarioScreen> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  String? selectedCicle; // Valor inicial del selector de horarios
  String? selectedEscuela; // Valor inicial del selector de categorías
  String? _current_semestre; //
  Map<DateTime, List<Event>> _events = {};

  @override
  void initState() {
    super.initState();
    selectedCicle = 'Ciclo 1'; // Valor inicial del selector de horarios
    selectedEscuela = 'Ingeniería de Software';
    _current_semestre = '2023-2';
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    _events = EventsCoord.getEventsByEscuelaCiclo(selectedEscuela,selectedCicle);
    _selectedEvents.value = _getEventsForDay(DateTime.now());
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day)  {
    // Implementation example
    return _events[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _updateCalendar() {
    setState(() {
      _events = EventsCoord.getEventsByEscuelaCiclo(selectedEscuela,selectedCicle);
    });
  }

  void _tapTile(Event evento) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalles del Curso'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Título: ${evento.title}'),
              // Agrega aquí más detalles según la estructura de tu Evento
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
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
        title: Text('Horarios $_current_semestre'),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
              value: selectedCicle,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCicle = newValue!;
                });
                _updateCalendar();
              },
              items: List.generate(10, (index) => index + 1).map<DropdownMenuItem<String>>((int value) {
                return DropdownMenuItem<String>(
                  value: 'Ciclo $value',
                  child: Text('Ciclo $value'),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            // Selector de categorías
            DropdownButton<String>(
              value: selectedEscuela,
              onChanged: (String? newValue) {
                setState(() {
                  selectedEscuela = newValue!;
                });
                _updateCalendar();
              },
              items: <String>['Ingeniería de Software', 'Ingeniería de Sistemas']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
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
                formatButtonVisible: false, // Oculta el botón para cambiar el formato
                leftChevronVisible: false, // Oculta la flecha izquierda
                rightChevronVisible: false, // Oculta la flecha derecha
              ),
              calendarStyle: CalendarStyle(
                // Use `CalendarStyle` to customize the UI
                outsideDaysVisible: false,
              ),
              onDaySelected: _onDaySelected,
              //onRangeSelected: _onRangeSelected,
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          onTap: () =>_tapTile(value[index]),
                          title: Text('${value[index]}'),
                        ),
                      );
                    },
                  );
                },
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
          margin: EdgeInsets.only(right: 16.0, bottom: 16.0), // Ajusta el margen según tus preferencias
          child: FloatingActionButton(
            onPressed: () {
              // Lógica de actualización aquí
              _updateCalendar();
            },
            child: Icon(Icons.update), // Icono de actualización
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}