import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = "webadmision.unmsm.edu.pe";
  static String user = "maxin";
  static String password = "PCG;91002105mhl?";
  static String db = "BD_G2_";
  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConection() async {
    var settings = ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db,
    );

    return await MySqlConnection.connect(settings);
  }

  Future<void> createTableAndInsertData() async {
    MySqlConnection? connection =
        null; // Inicializa como null antes del bloque try
    try {
      connection = await getConection();
      /*
      // Crear una tabla si no existe
      await connection.query('''
        CREATE TABLE IF NOT EXISTS animals (
          id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
          name VARCHAR(255),
          species VARCHAR(255)
        )
      ''');

      // Insertar datos
      await connection.query(
          'INSERT INTO animals (name, species) VALUES (?, ?), (?, ?), (?, ?)',
          ['Fluffy', 'Cat', 'Buddy', 'Dog', 'Spike', 'Turtle']);

      print('Tabla creada y datos insertados con éxito.');
      */
      // Realizar una consulta
      var results = await connection.query('SELECT * FROM TB_INM_asesor');
      for (var row in results) {
        print(
            'ID: ${row['cod_emp']}, Name: ${row['nombre']}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      try {
        if (connection != null) {
          await connection.close();
        }
      } catch (e) {
        print('Error al cerrar la conexión: $e');
      }
    }
  }
}

void main() async {
  var mysql = Mysql();
  await mysql.createTableAndInsertData();
}
