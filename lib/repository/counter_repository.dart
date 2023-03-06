import 'package:counter/models/counter.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CounterRepository {
  Future<Database> initDb() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          'CREATE TABLE counter (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, goal NUM NOT NULL, counter NUM NOT NULL)',
        );
      },
      version: 1,
    );
  }

  Future<void> newTasbih(Counter counter) async {
    final db = await initDb();
    await db.insert('counter', counter.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Counter?> getTasbih({required int id}) async {
    final db = await initDb();
    final List<Map<String, dynamic>> queryResult =
        await db.query('counter', where: 'id=?', whereArgs: [id]);
    if (queryResult.isNotEmpty) {
      return Counter.fromMap(queryResult.first);
    }
    return null;
  }

  Future<List<Counter>> getAllTasbih() async {
    final db = await initDb();
    final List<Map<String, dynamic>> queryResult = await db.query('counter');
    return queryResult.map((e) => Counter.fromMap(e)).toList();
  }

  Future<void> deleteTasbih(int id) async {
    final db = await initDb();
    await db.delete("counter", where: "id = ?", whereArgs: [id]);
  }

  Future<int> updateTasbih({required int counter, required int id}) async {
    final db = await initDb();
    return await db.rawUpdate(
        'UPDATE counter SET counter = ? WHERE id = ?', [counter, id]);
  }

  Future close() async {
    final db = await initDb();
    db.close();
  }
}
