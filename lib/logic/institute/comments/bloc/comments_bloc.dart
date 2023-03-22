import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/institute_controller.dart';
import 'package:studynotes/models/institute_model.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  InstituteController instituteController;
  CommentsBloc({required this.instituteController}) : super(CommentsInitial()) {
    on<CommentsGettingEvent>((event, emit) async{
      emit(CommentsLoading());
      try{
        var data = await instituteController.getComment(event.id);
        var rate = data.fold<int>(0, (sum, item) => sum + item.commentsRatting!.toInt());
        var avg = rate/data.length;
        emit(CommentsLoaded(commentModel: data,avg: avg));
      }
      catch(e){
        emit(CommentsError(error: "Something went wrong"));
      }
    });
  }
}
