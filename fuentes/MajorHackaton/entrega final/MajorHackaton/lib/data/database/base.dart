import 'package:mysql1/mysql1.dart';

class DatabaseTester {
  static String host = "localhost";
  static String user = "bruno";
  static String password = "1234";
  static String db = "AnimalShelter";

  static int port = 3306;

  Future<void> testDatabase() async {
    var settings = ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db,
    );

    var conn = await MySqlConnection.connect(settings);

    try {
      // Crear una tabla si no existe
      await conn.query('''
        CREATE TABLE IF NOT EXISTS animals (
          id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
          name VARCHAR(255),
          species VARCHAR(255)
        )
      ''');

      print('Tabla creada con éxito.');

      // Insertar un dato
      var result = await conn.query(
          'INSERT INTO animals (name, species) VALUES (?, ?)',
          ['Fluffy', 'Cat']);

      print('Dato insertado con éxito. ID: ${result.insertId}');
    } catch (e) {
      print('Error: $e');
    } finally {
      await conn.close();
    }
  }
}

void main() async {
  var tester = DatabaseTester();
  await tester.testDatabase();
}
