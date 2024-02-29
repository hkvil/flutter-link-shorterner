import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseService extends ChangeNotifier {
  late Database _db;
  final createTableHistory =
      "CREATE TABLE history (id INTEGER AUTOINCREMENT,shortUrl TEXT,longUrl TEXT,PRIMARY KEY(id))";

  Future<void> init() async {
    if (Platform.isWindows) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
    _db = await openDatabase(
      'my_database.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute(createTableHistory);
      },
    );
    notifyListeners();
  }

  Future<void> insert(String shortUrl, String longUrl) async {
    await _db.insert(
      'history',
      {
        'shortUrl': shortUrl,
        'longUrl': longUrl,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getHistory() async {
    var result = await _db.rawQuery("SELECT * FROM history");
    return result;
  }
}
