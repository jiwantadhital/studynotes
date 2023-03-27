import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/notices_controller.dart';
import 'package:studynotes/models/notice_model.dart';

part 't_notice_event.dart';
part 't_notice_state.dart';

class TNoticeBloc extends Bloc<TNoticeEvent, TNoticeState> {
  NoticeController noticeController;
  TNoticeBloc({required this.noticeController}) : super(TNoticeInitial()) {
    on<TNoticeGettingEvent>((event, emit) async{
      emit(TNoticeLoading());
      try{
        var data =await noticeController.getToday();
        emit(TNoticeLoaded(noticeModel: data));
      }
      catch(e){
        emit(TNoticeError(message: "Something Went Wrong"));
      }
    });
  }
}
