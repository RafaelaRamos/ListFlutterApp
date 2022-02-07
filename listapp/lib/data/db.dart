import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper instance = DBHelper._();

  static Database? _db;

  get database async {
    if (_db != null) return _db;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'lista.db'),
      version: 4,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_lista);
  }

  String get _lista => '''
    CREATE TABLE lista  (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      titulo TEXT,
      descricao TEXT,
      foto BLOB
    
    );
  ''';

 
}
