import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/notices_controller.dart';
import 'package:studynotes/models/notice_model.dart';

part 'notices_event.dart';
part 'notices_state.dart';

class NoticesBloc extends Bloc<NoticesEvent, NoticesState> {
  NoticeController noticeController;
  NoticesBloc({required this.noticeController}) : super(NoticesInitial()) {
    on<NoticeGetEvent>((event, emit) async{
      emit(NoticesLoading());
      try{
        var data = await noticeController.getNotice();
        emit(NoticesGot(noticeModel: data));
      }
      catch(e){
        emit(NoticesError(error: e.toString()));
      }
    });
  }
}
