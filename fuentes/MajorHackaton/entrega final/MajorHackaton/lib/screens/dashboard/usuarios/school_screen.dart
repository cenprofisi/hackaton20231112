import 'package:flutter/material.dart';
import 'package:fisiplan_app/screens/dashboard/create/crear_grupo_form.dart';
import 'package:fisiplan_app/screens/dashboard/create/gestion_horarios.dart';

class EscuelaScreen extends StatefulWidget {
  @override
  _EscuelaScreenState createState() => _EscuelaScreenState();
}

class _EscuelaScreenState extends State<EscuelaScreen> {
  bool _mostrarCrearGrupo = false;
  bool _mostrarCrearHorario = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Escuela Dashboard',
          style: TextStyle(fontSize: 24.0),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contenedor del lado izquierdo con imagen de perfil y botones
            Container(
              width: MediaQuery.of(context).size.width * 0.25, // Reducir el tamaño del contenedor
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40, // Reducir el tamaño del avatar
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.school,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Software',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navegar a la página de gestión de horarios
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GestionHorarios()),
                      );
                    },
                    icon: Icon(Icons.schedule),
                    label: Text('Crear Horario'),
                  ),
                  SizedBox(height: 12.0),
                  ElevatedButton.icon(
                    onPressed: () async {
                      setState(() {
                        _mostrarCrearGrupo = !_mostrarCrearGrupo;
                        _mostrarCrearHorario = false;
                      });
                    },
                    icon: Icon(Icons.group),
                    label: Text('Crear Grupo'),
                  ),
                ],
              ),
            ),
            // Contenedor para la gestión de horarios
            Visibility(
              visible: _mostrarCrearHorario,
              child: Expanded(
                child: GestionHorarios(),
              ),
            ),
            // Contenedor para el formulario de creación de grupo
            Visibility(
              visible: _mostrarCrearGrupo,
              child: CrearGrupoForm(),
            ),
          ],
        ),
      ),
    );
  }
}
