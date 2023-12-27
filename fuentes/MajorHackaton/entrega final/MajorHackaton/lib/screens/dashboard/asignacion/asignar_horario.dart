import 'package:flutter/material.dart';
import 'package:fisiplan_app/screens/dashboard/asignacion/seleccionar_grupo.dart';
import 'package:fisiplan_app/screens/dashboard/asignacion/seleccionar_aula.dart';

class AsignarHorariosScreen extends StatefulWidget {
  @override
  _AsignarHorariosScreenState createState() => _AsignarHorariosScreenState();
}

class _AsignarHorariosScreenState extends State<AsignarHorariosScreen> {
  List<String> horariosDisponibles = [
    'Lunes 8:00 AM - 10:00 AM',
    'Martes 2:00 PM - 4:00 PM',
    'Miércoles 10:30 AM - 12:30 PM',
    // Agregar más horarios según sea necesario
  ];

  List<String> horariosOcupados = [];

  List<String> aulasDisponibles = [
    'Aula 101',
    'Aula 102',
    'Aula 103',
    // Agregar más aulas según sea necesario
  ];

  List<String> aulasOcupadas = [];

  String busquedaGrupo = '';
  String busquedaAula = '';

  List<String> grupos = [
    'Grupo 1',
    'Grupo 2',
    'Grupo 3',
    // Agregar más grupos según sea necesario
  ];

  List<String> aulas = [
    'Aula 101',
    'Aula 102',
    'Aula 103',
    // Agregar más aulas según sea necesario
  ];

  String grupoSeleccionado = '';
  String aulaSeleccionada = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asignar Horarios y Aulas'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Horarios Disponibles',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    busquedaGrupo = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Buscar grupo...',
                ),
              ),
              SizedBox(height: 16.0),
              _buildTabla('Disponibles', horariosDisponibles, _mostrarSelectorGrupo),
              SizedBox(height: 16.0),
              _buildTabla('Ocupados', horariosOcupados, null),
              SizedBox(height: 16.0),
              Text(
                'Aulas Disponibles',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    busquedaAula = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Buscar aula...',
                ),
              ),
              SizedBox(height: 16.0),
              _buildTabla('Disponibles', aulasDisponibles, _mostrarSelectorAula),
              SizedBox(height: 16.0),
              _buildTabla('Ocupadas', aulasOcupadas, null),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabla(String titulo, List<String> items, Function(String)? onTap) {
    List<String> itemsFiltrados = items
        .where((item) => item.toLowerCase().contains(
              titulo.toLowerCase() == 'Disponibles' ? busquedaGrupo.toLowerCase() : busquedaAula.toLowerCase(),
            ))
        .toList();

    return Card(
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              titulo,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: itemsFiltrados.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(itemsFiltrados[index]),
                trailing: ElevatedButton(
                  onPressed: onTap != null
                      ? () {
                          onTap(itemsFiltrados[index]);
                        }
                      : null,
                  child: Text('Asignar'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _mostrarSelectorGrupo(String horario) async {
  var grupoSeleccionado = await Navigator.push<String>(
    context,
    MaterialPageRoute(
      builder: (context) => SeleccionarGrupoScreen(
        grupos: grupos,
        onGrupoSelected: (grupo) {
          Navigator.pop(context, grupo);
        },
      ),
    ),
  );

  if (grupoSeleccionado != null) {
    setState(() {
      grupoSeleccionado = grupoSeleccionado;
      _asignarHorarioConGrupo(horario, grupoSeleccionado!);
    });
  }
}


  void _mostrarSelectorAula(String horario) async {
  var aulaSeleccionada = await Navigator.push<String>(
    context,
    MaterialPageRoute(
      builder: (context) => SeleccionarAulaScreen(
        aulas: aulas,
        onAulaSelected: (aula) {
          Navigator.pop(context, aula);
        },
      ),
    ),
  );

  if (aulaSeleccionada != null) {
    setState(() {
      aulaSeleccionada = aulaSeleccionada;
      _asignarHorarioConAula(horario, aulaSeleccionada!);
    });
  }
}

  void _asignarHorarioConGrupo(String horario, String grupo) {
    setState(() {
      horariosOcupados.add('$grupo: $horario');
      horariosDisponibles.remove(horario);
    });
  }

  void _asignarHorarioConAula(String horario, String aula) {
    setState(() {
      aulasOcupadas.add('$aula: $horario');
      horariosDisponibles.remove(horario);
    });
  }
}



