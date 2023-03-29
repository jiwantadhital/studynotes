import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:studynotes/local_databases/sqlite/chapter_database.dart';
import 'package:studynotes/local_databases/sqlite/chapter_database_model.dart';

class ChapterDatabaseController{
  List<DescDatabaseModel> desc =[];
   List<ChapterDModel> chapter =[];
   List<SubjectDatabaseModel> subject =[];
   List<ChapterModelDatabase> allChapters =[];
   


  Future<List<ChapterDModel>> getChapter(cid)async{
  this.chapter = await ChapterDatabase.instance.readAll(cid);
  return await ChapterDatabase.instance.readAll(cid);
}

//desc



 Future<List<DescDatabaseModel>> getDesc(cid)async{
  this.desc = await ChapterDatabase.instance.readDesc(cid);
  return await ChapterDatabase.instance.readDesc(cid);
}
Future getSubject()async{
  this.subject = await ChapterDatabase.instance.readSubject();
}

Future<List<ChapterModelDatabase>> getAllChapters()async{
  return await ChapterDatabase.instance.readChapters();
}


Future addChapterData(semester,s_id,subject,chapterId,chapterName,chapterNumber,chapterDesc,pdf)async{
final chapters =  ChapterModelDatabase(semester: semester,s_id: s_id, subject: subject, c_id: chapterId,
 c_name: chapterName, c_number: chapterNumber, c_desc: chapterDesc,pdf: pdf);
await ChapterDatabase.instance.create(chapters,chapterId);
}

// Future update(name,sclass,roll,terminal,percentage)async{
// final students =  StudentModelDatabase(sclass: sclass, name: name, terminal: terminal, roll: roll, percentage: percentage);
// await StudentDatabase.instance.update(students);
// }
Future delete(id)async{
  await  ChapterDatabase.instance.delete(id);
}
}