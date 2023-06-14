import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  DatabaseHelper._internal();

  initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Games.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
  CREATE TABLE Games(
    id INTEGER PRIMARY KEY,
    name TEXT,
    desc TEXT,
    urls TEXT 
  )
''');
      },
    );
  }

  Future<int> insertGame(Map<String, dynamic> Game) async {
    var dbClient = await database;
    return await dbClient.insert('Games', Game,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getGames() async {
    var dbClient = await database;
    return await dbClient.query('Games');
  }

  Future<int> deleteGame(int id) async {
    var dbClient = await database;
    return await dbClient.delete('Games', where: 'id = ?', whereArgs: [id]);
  }
}
