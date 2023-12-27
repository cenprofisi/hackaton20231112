import 'group_schedule.dart';

class AsignacionHorarios {
  List<GrupoHorario> horariosOcupados = [];

  // Función para verificar si un horario está disponible
  bool isHorarioDisponible(GrupoHorario nuevoHorario) {
    for (var horarioOcupado in horariosOcupados) {
      // Verificar si hay superposición de horarios
      if (horarioOcupado.grupoCodigo == nuevoHorario.grupoCodigo &&
          horarioOcupado.diaCodigo == nuevoHorario.diaCodigo &&
          !(nuevoHorario.horaInicio.isAfter(horarioOcupado.horaFinal) ||
              nuevoHorario.horaFinal.isBefore(horarioOcupado.horaInicio))) {
        return false; // Horario ocupado
      }
    }
    return true; // Horario disponible
  }

  // Función para asignar un horario a un grupo
  void asignarHorario(GrupoHorario nuevoHorario) {
    if (isHorarioDisponible(nuevoHorario)) {
      horariosOcupados.add(nuevoHorario);
      print('Horario asignado correctamente.');
    } else {
      print('Error: El horario está ocupado.');
    }
  }

  // Función para mostrar horarios disponibles y ocupados
  void mostrarHorarios() {
    print('Horarios disponibles:');
    // Lógica para obtener y mostrar horarios disponibles
    // ...

    print('\nHorarios ocupados:');
    for (var horarioOcupado in horariosOcupados) {
      print(
          'Grupo ${horarioOcupado.grupoCodigo}: ${horarioOcupado.diaCodigo} ${horarioOcupado.horaInicio} - ${horarioOcupado.horaFinal}');
    }
  }
}
