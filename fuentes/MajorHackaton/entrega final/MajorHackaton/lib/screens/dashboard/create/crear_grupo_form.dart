import 'package:flutter/material.dart';

class CrearGrupoForm extends StatefulWidget {
  @override
  _CrearGrupoFormState createState() => _CrearGrupoFormState();
}

class _CrearGrupoFormState extends State<CrearGrupoForm> {
  int _codigo = 0;
  int _numero = 0;

  List<String> _semestres = ['Ciclo I', 'Ciclo II'];
  String _selectedSemestre = 'Ciclo I';

  List<String> _grupos = ['Grupo A', 'Grupo B', 'Grupo C'];
  String _selectedGrupo = 'Grupo A';

  List<String> _cursos = ['Curso 1', 'Curso 2', 'Curso 3'];
  String _selectedCurso = 'Curso 1';

  List<Map<String, dynamic>> _tablaInformacion = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Panel lateral interesante
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.leaderboard,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Estadísticas',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Grupos: ${_grupos.length}',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Semestres: ${_semestres.length}',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Cursos: ${_cursos.length}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.0),
            // Formulario
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.school,
                          color: Colors.white,
                          size: 40.0,
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Formulario de Grupo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  DropdownButton<String>(
                    value: _selectedSemestre,
                    items: _semestres.map((semestre) {
                      return DropdownMenuItem<String>(
                        value: semestre,
                        child: Text(semestre),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedSemestre = value!;
                      });
                    },
                    hint: Text('Selecciona el semestre'),
                  ),
                  SizedBox(height: 16.0),
                  DropdownButton<String>(
                    value: _selectedGrupo,
                    items: _grupos.map((grupo) {
                      return DropdownMenuItem<String>(
                        value: grupo,
                        child: Text(grupo),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedGrupo = value!;
                      });
                    },
                    hint: Text('Selecciona el grupo'),
                  ),
                  SizedBox(height: 16.0),
                  DropdownButton<String>(
                    value: _selectedCurso,
                    items: _cursos.map((curso) {
                      return DropdownMenuItem<String>(
                        value: curso,
                        child: Text(curso),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCurso = value!;
                      });
                    },
                    hint: Text('Selecciona el curso'),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Código'),
                          keyboardType: TextInputType.number,
                          initialValue: _codigo.toString(),
                          readOnly: true,
                        ),
                        SizedBox(height: 8.0),
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
                          style: ElevatedButton.styleFrom(
                            primary: Colors.indigo, // Color del botón
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text('Enviar'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.0),
            // Tabla de información
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Código')),
                      DataColumn(label: Text('Semestre')),
                      DataColumn(label: Text('Grupo')),
                      DataColumn(label: Text('Curso')),
                      DataColumn(label: Text('Número')),
                    ],
                    rows: _tablaInformacion.map((data) {
                      return DataRow(
                        cells: [
                          DataCell(Text(data['codigo'].toString())),
                          DataCell(Text(_semestres[data['semestreCodigo']])),
                          DataCell(Text(_grupos[data['grupoCodigo']])),
                          DataCell(Text(_cursos[data['cursoCodigo']])),
                          DataCell(Text(data['numero'].toString())),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_validateForm()) {
      // Actualizar la tabla de información
      _tablaInformacion.add({
        'codigo': _codigo,
        'semestreCodigo': _semestres.indexOf(_selectedSemestre),
        'grupoCodigo': _grupos.indexOf(_selectedGrupo),
        'cursoCodigo': _cursos.indexOf(_selectedCurso),
        'numero': _numero,
      });

      // Limpiar el formulario
      _codigo = 0;
      _numero = 0;

      // Actualizar la vista
      setState(() {});
    }
  }

  bool _validateForm() {
    // Lógica de validación del formulario
    return true;
  }
}
