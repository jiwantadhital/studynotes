import 'package:sqflite/sqlite_api.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:studynotes/local_databases/sqlite/chapter_database_model.dart';

class ChapterDatabase{
  static final ChapterDatabase instance = ChapterDatabase._init();

static Database? _database;
ChapterDatabase._init();

Future<Database> get database async{
  if(_database != null) return _database!;
  _database = await _initDB("chapter.db");
  return _database!;
}

Future<Database> _initDB(String filePath) async{
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, filePath);
  return openDatabase(path,version: 1,onCreate: _createDB);
}

Future _createDB(Database db, int version) async{
  final idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
  final textType = "TEXT NOT NULL";
  final boolType = "BOOLEAN NOT NULL";
  final integerType = "INTEGER NOT NULL";
  final doubleType = "DOUBLE NOT NULL";

  await db.execute(
    '''
    CREATE TABLE $tableChapter(
      ${ChapterFields.id} $idType,
    )
    '''
  );
}

}

