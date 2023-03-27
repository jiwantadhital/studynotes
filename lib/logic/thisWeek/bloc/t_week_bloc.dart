import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/notices_controller.dart';
import 'package:studynotes/models/notice_model.dart';

part 't_week_event.dart';
part 't_week_state.dart';

class TWeekBloc extends Bloc<TWeekEvent, TWeekState> {
  NoticeController noticeController;
  TWeekBloc({required this.noticeController}) : super(TWeekInitial()) {
    on<TweekGettingEvent>((event, emit) async{
      emit(TWeekLoading());
      try{
        var data = await noticeController.getWeek();
        emit(TWeekLoaded(noticeModel: data));
      }
      catch(e){
        emit(TWeekError(message: "Something went wrong"));
      }
    });
  }
}
