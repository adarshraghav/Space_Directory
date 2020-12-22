import 'dart:async';
import 'package:employee_record/spacex/connect.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'connect.dart';

class DBHelper1 {
  Database _database;

  Future openDb() async {
    if (_database == null) {
      _database = await openDatabase(
          join(await getDatabasesPath(), 'spacex.db'),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE spacex(id INTEGER PRIMARY KEY autoincrement, name TEXT, location TeXT, datum TEXT)',
        );
      });
    }
  }

  Future<int> insertEmployee(Connect employee) async {
    await openDb();
    return await _database.insert('spacex', employee.toMap());
  }

  Future<List<Connect>> getEmployeeList() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('spacex');
    return List.generate(maps.length, (i) {
      return Connect(
          id: maps[i]['id'],
          name: maps[i]['name'],
          location: maps[i]['location'],
          datum: maps[i]['datum']);
    });
  }

  Future<int> updateEmployee(Connect employee) async {
    await openDb();
    return await _database.update('spacex', employee.toMap(),
        where: "id = ?", whereArgs: [employee.id]);
  }

  Future<void> deleteEmployee(int id) async {
    await openDb();
    await _database.delete('spacex', where: "id = ?", whereArgs: [id]);
  }
}
