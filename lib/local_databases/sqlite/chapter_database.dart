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
  _database = await _initDB("tchaptes.db");
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
      ${ChapterFields.semester} $textType,
      ${ChapterFields.s_id} $integerType,
      ${ChapterFields.subject} $textType,
      ${ChapterFields.c_id} $integerType,
      ${ChapterFields.c_name} $textType,
      ${ChapterFields.c_number} $textType,
      ${ChapterFields.c_desc} $textType
    )
    '''
  );
}
//create database
Future<ChapterModelDatabase> create(ChapterModelDatabase chapterModelDatabase)async{
  final db = await instance.database;

  final id = await db.insert(tableChapter, chapterModelDatabase.toJson());
  return chapterModelDatabase.copy(id:id);
}

//readall
// Future<List<ChapterModelDatabase>> readAll()async{
// final db = await  instance.database;
// final orderBy = '${ChapterFields.id} ASC';

// final result = await db.query(tableChapter,orderBy: orderBy);
// return result.map((json) => ChapterModelDatabase.fromJson(json)).toList();
// }

//read subjects
Future<List<SubjectDatabaseModel>> readSubject()async{
final db = await  instance.database;
final orderBy = '${ChapterFields.subject} ASC';

final result = await db.query(tableChapter,orderBy: orderBy,
distinct: true,
columns: [ChapterFields.s_id, ChapterFields.subject,ChapterFields.semester],
);
print(result);
return result.map((json) => SubjectDatabaseModel.fromJson(json)).toList();
}

//readChapters
Future<List<ChapterModelDatabase>> readAll(cid)async{
final db = await  instance.database;
final orderBy = '${ChapterFields.id} ASC';

final result = await db.query(tableChapter,orderBy: orderBy,
where: "${ChapterFields.s_id} = ? ",
whereArgs: [cid],
);
return result.map((json) => ChapterModelDatabase.fromJson(json)).toList();
}
//update
Future<int> update(ChapterModelDatabase chapterModelDatabase)async{
  final db = await instance.database;
  return db.update(tableChapter, chapterModelDatabase.toJson(),
  where: '${ChapterFields.id} = ?',
  whereArgs: [chapterModelDatabase.id],
  );
}

//delete
Future<int> delete(int id) async{
  final db = await instance.database;
  return await db.delete(tableChapter,
  where: '${ChapterFields.id} = ?',
  whereArgs: [id]
  );
}
}

