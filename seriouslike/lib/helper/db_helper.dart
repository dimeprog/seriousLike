import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:flutter/foundation.dart';

class DbHelper {
// ignore: non_constant_identifier_names
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    final sqlDb = await sql.openDatabase(
      path.join(dbPath, 'place.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE user_place(id TEXT PRIMARY KEY,image TEXT, title TEXT, loc_lat REAL, loc_long REAL, address TEXT)');
      },
      version: 1,
    );
    return sqlDb;
  }

  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await DbHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbHelper.database();
    return db.query(table);
  }
}
