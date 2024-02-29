import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseService extends ChangeNotifier {
  late Database _db;

  DatabaseService() {
    init();
  }
  final createTableHistory =
      "CREATE TABLE history (id INTEGER PRIMARY KEY AUTOINCREMENT,shortUrl TEXT,longUrl TEXT)";

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
    print(_db);
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
    notifyListeners();
  }

  Future<List<Map<String, dynamic>>> getHistory() async {
    var result = await _db.query("history");
    return result;
  }
}
