import 'package:studynotes/controllers/notes_controller.dart';
import 'package:studynotes/logic/database/chapters/bloc/chapters_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NotesFunction{
NotesController notesController = NotesController();

dataSave(id,context)async{
 await notesController.getNotes(id);
                 int i;
                 var data = notesController.allnotes;
                  for(i=0;i>notesController.allnotes.length;i++){
                  }
                 BlocProvider.of<ChaptersBloc>(context).add(ChaptersCreatingEvent(
                  semester: data[i].semester.name,
                  subject: data[i].subject.title,
                  subjectId: data[i].subject.id,
                  chapterId: id,
                  chapterName: data[i].chapter.name,
                  chapterNumber: data[i].chapter.number.toString(),
                  chapterDesc: data[i].notes,
                  ));
}

}