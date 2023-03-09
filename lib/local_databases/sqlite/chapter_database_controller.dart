import 'package:studynotes/local_databases/sqlite/chapter_database.dart';
import 'package:studynotes/local_databases/sqlite/chapter_database_model.dart';

class ChapterDatabaseController{
   List<ChapterModelDatabase> chapter =[];
   List<SubjectDatabaseModel> subject =[];


  Future getChapter(cid)async{
  this.chapter = await ChapterDatabase.instance.readAll(cid);
}
Future getSubject()async{
  this.subject = await ChapterDatabase.instance.readSubject();
}

Future addChapterData(semester,s_id,subject,chapterId,chapterName,chapterNumber,chapterDesc)async{
final chapters =  ChapterModelDatabase(semester: semester,s_id: s_id, subject: subject, c_id: chapterId,
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