import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/auth_controller.dart';

part 'editprofile_event.dart';
part 'editprofile_state.dart';

class EditprofileBloc extends Bloc<EditprofileEvent, EditprofileState> {
  AuthController authController;
  EditprofileBloc({required this.authController}) : super(EditprofileInitial()) {
    on<EditingEvent>((event, emit) async{
      emit(EditProfileLoading());
      try{
        await authController.editProfile(event.name, event.phone, event.sem,event.image);
        var data = authController.editProfileModel;
        if(data.success==true){
              emit(EditProfileEdited());
              }
              if(data.success==false){
                emit(EditProfileError(message: "Error"));
              }
              }
      catch(e){
        print("error");
            emit(EditProfileError(message: e.toString()));
      }
    });
  }
}
