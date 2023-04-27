
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
  const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
  const textType = "TEXT NOT NULL";
  const textNullType = "TEXT NULL";
  const boolType = "BOOLEAN NOT NULL";
  const integerType = "INTEGER NOT NULL";
  const doubleType = "DOUBLE NOT NULL";

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
      ${ChapterFields.c_desc} $textNullType,
      ${ChapterFields.pdf} $textNullType
    )
    '''
  );
}
//create database
Future create(ChapterModelDatabase chapterModelDatabase,aid)async{
  final db = await instance.database;
  final existingRecord = await db.query(tableChapter, where: '${ChapterFields.c_id} = ?', whereArgs: [aid]);
  if(existingRecord.isEmpty){
  final id = await db.insert(tableChapter, chapterModelDatabase.toJson());
  return chapterModelDatabase.copy(id:id);
  }
  else{
   return db.update(tableChapter, chapterModelDatabase.toJson(),
  where: '${ChapterFields.id} = ?',
  whereArgs: [chapterModelDatabase.id],
  );
  }
}

//read all
Future<List<ChapterModelDatabase>> readChapters()async{
final db = await  instance.database;
const orderBy = '${ChapterFields.id} ASC';

final result = await db.query(tableChapter,orderBy: orderBy);
return result.map((json) => ChapterModelDatabase.fromJson(json)).toList();
}
//read subjects
Future<List<SubjectDatabaseModel>> readSubject()async{
final db = await  instance.database;
const orderBy = '${ChapterFields.subject} ASC';

final result = await db.query(tableChapter,orderBy: orderBy,
distinct: true,
columns: [ChapterFields.s_id, ChapterFields.subject,ChapterFields.semester],
);
print(result);
return result.map((json) => SubjectDatabaseModel.fromJson(json)).toList();
}

//readChapters
Future<List<ChapterDModel>> readAll(cid)async{
final db = await  instance.database;
const orderBy = '${ChapterFields.c_id} ASC';

final result = await db.query(tableChapter,orderBy: orderBy,
columns: [ChapterFields.s_id, ChapterFields.subject,ChapterFields.semester,ChapterFields.c_name,ChapterFields.c_number,ChapterFields.c_id,ChapterFields.id,ChapterFields.pdf],
where: "${ChapterFields.s_id} = ? ",
whereArgs: [cid],
);
return result.map((json) => ChapterDModel.fromJson(json)).toList();
}
//readDesc
Future<List<DescDatabaseModel>> readDesc(cid)async{
final db = await  instance.database;
const orderBy = '${ChapterFields.c_id} ASC';

final result = await db.query(tableChapter,orderBy: orderBy,
distinct: true,
columns: [ChapterFields.c_id, ChapterFields.c_desc,ChapterFields.pdf],
where: "${ChapterFields.c_id} = ? ",
whereArgs: [cid],
);
return result.map((json) => DescDatabaseModel.fromJson(json)).toList();
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

