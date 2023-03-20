import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/institute_controller.dart';

part 'pcomments_event.dart';
part 'pcomments_state.dart';

class PcommentsBloc extends Bloc<PcommentsEvent, PcommentsState> {
  InstituteController instituteController;
  PcommentsBloc({required this.instituteController}) : super(PcommentsInitial()) {
    on<PostingEvent>((event, emit) async{
                

      emit(PcommentsPosting());
  

      try{
var data = await instituteController.postComment(event.rate,event.desc, event.id, event.studentId, event.collegeId);
        if(data.messgae==true){
        emit(PcommentsPosted());
        }
        else{
          print("object");
          emit(PcommentsError(error: "Something is wrong"));
        }
      }
      catch(e){

        emit(PcommentsError(error: "Something went Wrong"));
      }
    });
  }
}
