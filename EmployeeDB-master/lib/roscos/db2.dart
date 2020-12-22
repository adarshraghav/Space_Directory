import 'dart:async';
import 'package:employee_record/spacex/connect.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'connector.dart';

class DBHelper2 {
  Database _database;

  Future openDb() async {
    if (_database == null) {
      _database = await openDatabase(
          join(await getDatabasesPath(), 'roscos.db'),
          version: 1, 
          onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE roscos(id INTEGER PRIMARY KEY autoincrement, name TEXT, location TeXT, datum TEXT, detail TEXT, rockstat TEXT, cost TEXT, missionstat TEXT)',
        );
      });
    }
  }

  Future<int> insertEmployee(Connector employee) async {
    await openDb();
    return await _database.insert('roscos', employee.toMap());
  }

  Future<List<Connector>> getEmployeeList() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('roscos');
    return List.generate(maps.length, (i) {
      return Connector(
        id: maps[i]['id'],
        name: maps[i]['name'],
        location: maps[i]['location'],
        datum: maps[i]['datum'],
        detail: maps[i]['detail'],
        rockstat: maps[i]['rockstat'],
        cost: maps[i]['cost'],
        missionstat: maps[i]['missionstat'],
      );
    });
  }

  Future<int> updateEmployee(Connector employee) async {
    await openDb();
    return await _database.update('roscos', employee.toMap(),
        where: "id = ?", whereArgs: [employee.id]);
  }

  Future<void> deleteEmployee(int id) async {
    await openDb();
    await _database.delete('roscos', where: "id = ?", whereArgs: [id]);
  }
}
