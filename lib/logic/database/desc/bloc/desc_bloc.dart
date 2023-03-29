import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/local_databases/sqlite/chapter_database_controller.dart';
import 'package:studynotes/local_databases/sqlite/chapter_database_model.dart';

part 'desc_event.dart';
part 'desc_state.dart';

class DescBloc extends Bloc<DescEvent, DescState> {
    ChapterDatabaseController chapterDatabaseController;
  DescBloc({required this.chapterDatabaseController}) : super(DescInitial()) {
    on<DescGettingEvent>((event, emit) async{
      emit(DescLoading());
      try{
        await chapterDatabaseController.getDesc(event.id);
        emit(DescGot(desc: chapterDatabaseController.desc));
      }
      catch(e){
                print(e);
        emit(DescError(message: e.toString()));
      }
    });
  }
}
