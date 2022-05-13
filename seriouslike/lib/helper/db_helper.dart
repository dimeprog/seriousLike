import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:flutter/foundation.dart';

class DbHelper {
  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final dbPath = await sql.getDatabasesPath();
    final sqlDb = await sql.openDatabase(path.join(dbPath, 'place.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_palce(id TEXT PRIMARY KEY,image TEXT, title TEXT,)');
    });
    await sqlDb.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }
}
