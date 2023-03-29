import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:studynotes/controllers/notes_controller.dart';
import 'package:studynotes/logic/database/chapters/bloc/chapters_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/resources/constants.dart';

class NotesFunction{
NotesController notesController = NotesController();

dataSave(id,context)async{
 await notesController.getNotes(id);
                 int i;
                 var data = notesController.allnotes;
                  for(i=0;i>notesController.allnotes.length;i++){
                  }
                  if(data[i].image!=null){
                 SavePdf().downloadPDF(data[i].image, "${ApiClass.local}uploads/images/lab/pdf/${data[i].image}");
                 }else{
                  print("null");
                 }
                 BlocProvider.of<ChaptersBloc>(context).add(ChaptersCreatingEvent(
                  semester: data[i].semester.name,
                  subject: data[i].subject.title,
                  subjectId: data[i].subject.id,
                  chapterId: id,
                  chapterName: data[i].chapter.name,
                  chapterNumber: data[i].chapter.number.toString(),
                  chapterDesc: data[i].notes??"",
                  pdf: data[i].image??""
                  ));
}

}


class SavePdf{
    Future<void> downloadPDF(fileNam,url) async {
    final directory = await getApplicationDocumentsDirectory();
    final filename = fileNam;
    final path = '${directory.path}/$filename';
    final response = await http.get(Uri.parse(url));
    final file = File(path);

    await file.writeAsBytes(response.bodyBytes);
    
  }

  seePdf(fileNam) async {
    final directory = await getApplicationDocumentsDirectory();
    final filename = fileNam;
    final path = '${directory.path}/$filename';
    return path;
  }
     Future<List<int>> readPDFFile(String path) async {
  final file = File(path);
  final bytes = await file.readAsBytes();
  return bytes;
}
}