import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = 'hackaton',
      user = 'root',
      password = 'root',
      db = 'hackaton2023'; //Nombre de la base de datos
  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConection() async {
    var settings = new ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);
    return await MySqlConnection.connect(settings);
  }
}
