import 'package:flutter/material.dart';

class AdministradorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administrador Dashboard'),
        actions: [
          IconButton(
            onPressed: () {
              // Lógica para cerrar sesión
              // Navigator.pushReplacement(...) para ir a la pantalla de inicio de sesión
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contenedor del lado izquierdo con imagen de perfil y botones
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
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
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/login/admin.png'),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Bienvenido, Administrador',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Esta sección permite asignar aulas a secciones. Puedes ver la disponibilidad de las aulas y asignarlas a grupos específicos.',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            // Espacio para la tabla que mostrará el horario
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
                child: AsignacionAulasTable(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AsignacionAulasTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulación de datos de aulas y su disponibilidad
    List<Aula> aulas = [
      Aula(nombre: 'Aula 101', disponible: true),
      Aula(nombre: 'Aula 102', disponible: false),
      // Agrega más aulas según tus necesidades
    ];

    return DataTable(
      columns: [
        DataColumn(label: Text('Aula')),
        DataColumn(label: Text('Estado')),
        DataColumn(label: Text('Grupo')),
        DataColumn(label: Text('Hora Asignada')),
        DataColumn(label: Text('Acciones')),
      ],
      rows: List.generate(10, (index) {
        Aula aula = aulas[index % aulas.length];
        return DataRow(
          cells: [
            DataCell(Text(aula.nombre)),
            DataCell(
              aula.disponible
                  ? Icon(Icons.check, color: Colors.green)
                  : Icon(Icons.close, color: Colors.red),
            ),
            DataCell(
              aula.disponible
                  ? DropdownButton<String>(
                      hint: Text('Seleccionar grupo'),
                      items: ['Grupo A', 'Grupo B'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        // Lógica para seleccionar el grupo
                      },
                    )
                  : Text('No disponible'),
            ),
            DataCell(
              aula.disponible
                  ? Text('De 8:00 AM a 10:00 AM') // Modificar según tus necesidades
                  : Text('No disponible'),
            ),
            DataCell(
              ElevatedButton(
                onPressed: aula.disponible
                    ? () {
                        // Lógica para asignar el aula
                        // Puedes abrir un cuadro de diálogo, por ejemplo
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Asignar Aula'),
                              content: Text('¿Deseas asignar esta aula a una sección?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancelar'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Lógica para asignar el aula a la sección
                                    // ...
                                    Navigator.pop(context);
                                  },
                                  child: Text('Asignar'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  primary: aula.disponible ? Colors.blue : Colors.grey,
                ),
                child: Text('Asignar'),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class Aula {
  final String nombre;
  final bool disponible;

  Aula({required this.nombre, required this.disponible});
}
