import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'database_model.dart';

class DBHelper {
  static const _dbName = 'user.db';
  static const _tableName = 'TBL_USER';
  static Database? _db;

  Future<Database> get database async {
    return _db ??= await _initDB();
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName(
            UID INTEGER PRIMARY KEY AUTOINCREMENT,
            NAME TEXT,
            CITY TEXT,
            GENDER TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertUser(User user) async {
    final db = await _initDB();
    return await db.insert(_tableName, user.toMap());
  }

  Future<List<User>> getUsers() async {
    final db = await _initDB();
    final result = await db.query(_tableName);
    return result.map((e) => User.fromMap(e)).toList();
  }

  Future<int> updateUser(User user) async {
    final db = await database;
    return await db.update(
      _tableName,
      user.toMap(),
      where: 'UID = ?',
      whereArgs: [user.uid],
    );
  }

  Future<int> deleteUser(int uid) async {
    final db = await _initDB();
    return await db.delete(_tableName, where: 'UID = ?', whereArgs: [uid]);
  }
}
