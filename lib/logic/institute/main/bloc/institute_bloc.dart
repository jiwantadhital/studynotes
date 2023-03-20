import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/institute_controller.dart';
import 'package:studynotes/models/institute_model.dart';

part 'institute_event.dart';
part 'institute_state.dart';

class InstituteBloc extends Bloc<InstituteEvent, InstituteState> {
  InstituteController instituteController;
  InstituteBloc({required this.instituteController}) : super(InstituteInitial()) {
    on<InstituteEvent>((event, emit) async{
      emit(InstituteLoading());
      try{
        var data = await instituteController.getInstitute();
        emit(InstituteLoaded(instituteModel: data));
      }
      catch(e){
        emit(InstituteError(error: "Something went wrong"));
      }
    });
  }
}
