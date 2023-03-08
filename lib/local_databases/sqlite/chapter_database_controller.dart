import 'package:studynotes/local_databases/sqlite/chapter_database.dart';
import 'package:studynotes/local_databases/sqlite/chapter_database_model.dart';

class ChapterDatabaseController{
  late List<ChapterModelDatabase> chapter;


  Future getChapter()async{
  this.chapter = await ChapterDatabase.instance.readAll();
}

Future addChapterData(semester,subject,chapterId,chapterName,chapterNumber,chapterDesc)async{
final chapters =  ChapterModelDatabase(semester: semester, subject: subject, c_id: chapterId,
 c_name: chapterName, c_number: chapterNumber, c_desc: chapterDesc);
await ChapterDatabase.instance.create(chapters);
}

// Future update(name,sclass,roll,terminal,percentage)async{
// final students =  StudentModelDatabase(sclass: sclass, name: name, terminal: terminal, roll: roll, percentage: percentage);
// await StudentDatabase.instance.update(students);
// }
Future delete(id)async{
  await  ChapterDatabase.instance.delete(id);
}
}