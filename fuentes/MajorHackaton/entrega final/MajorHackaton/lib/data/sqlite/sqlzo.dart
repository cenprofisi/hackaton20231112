import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'animals.db');

    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE animals (
        id INTEGER PRIMARY KEY,
        name TEXT,
        species TEXT
      )
    ''');
  }

  Future<int> insertAnimal(String name, String species) async {
    Database? dbClient = await db;
    try {
      return await dbClient!.insert('animals', {'name': name, 'species': species});
    } catch (e) {
      print('Error inserting animal: $e');
      return -1;
    }
  }

  Future<List<Map<String, dynamic>>> getAnimals() async {
    Database? dbClient = await db;
    try {
      return await dbClient!.query('animals');
    } catch (e) {
      print('Error getting animals: $e');
      return [];
    }
  }

  // Agrega más métodos según tus necesidades...

  Future<void> close() async {
    Database? dbClient = await db;
    await dbClient!.close();
    _db = null;
  }
}

void main() async {
  var dbHelper = DatabaseHelper();
  
  await dbHelper.insertAnimal('Fluffy', 'Cat');
  await dbHelper.insertAnimal('Buddy', 'Dog');
  await dbHelper.insertAnimal('Spike', 'Turtle');

  List<Map<String, dynamic>> animals = await dbHelper.getAnimals();
  print('Animals: $animals');

  await dbHelper.close();
}
