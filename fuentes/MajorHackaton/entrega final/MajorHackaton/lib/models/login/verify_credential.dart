import 'dart:convert';

class Credenciales {
  final String correo;
  final String contrasena;

  Credenciales({required this.correo, required this.contrasena});

  factory Credenciales.fromJson(Map<String, dynamic> json) {
    return Credenciales(
      correo: json['correo'],
      contrasena: json['contrasena'],
    );
  }
}

Map<String, Credenciales> cargarCredenciales() {
  try {
    // Simulando la carga de credenciales desde un archivo JSON incorporado
    String jsonString = '''
      {
        "Vicedecanato": {"correo": "vicedecanato@correo.com", "contrasena": "contraseñaVicedecanato"},
        "Escuela": {"correo": "escuela@correo.com", "contrasena": "contraseñaEscuela"},
        "Administrador": {"correo": "admin@correo.com", "contrasena": "contraseñaAdmin"}
      }
    ''';

    // Decodifica el contenido JSON
    Map<String, dynamic> credencialesMap = json.decode(jsonString);

    // Convierte las credenciales a objetos Credenciales
    Map<String, Credenciales> credenciales = {};
    credencialesMap.forEach((key, value) {
      credenciales[key] = Credenciales.fromJson(value);
    });

    return credenciales;
  } catch (error) {
    print('Error al cargar las credenciales: $error');
    return {};
  }
}

bool verificarCredenciales(String userType, String email, String password) {
  // Obtener las credenciales desde el archivo JSON
  Map<String, Credenciales> usuariosCredenciales = cargarCredenciales();

  // Verificar las credenciales
  Credenciales? credencialesGuardadas = usuariosCredenciales[userType];
  if (credencialesGuardadas != null) {
    if (credencialesGuardadas.correo == email && credencialesGuardadas.contrasena == password) {
      return true; // Credenciales válidas
    }
  }

  return false; // Credenciales inválidas
}

