import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/auth_controller.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';

part 'google_event.dart';
part 'google_state.dart';

class GoogleBloc extends Bloc<GoogleEvent, GoogleState> {
  AuthController authController;
  GoogleBloc({required this.authController}) : super(GoogleInitial()) {
    on<GoogleLoginEvent>((event, emit) async{
        print("object");
      emit(GoogleLoading());
    
      try{
       var data = await authController.google(event.token);
        if(data.message=="successfull"){
                      print("Here");
          UserSimplePreferences.setToken(data.token.toString());
          UserSimplePreferences.setUserID(data.userId!.toInt());
          UserSimplePreferences.setUserName(data.userName.toString());
          UserSimplePreferences.setVerified(true);
          emit(GoogleLoggedIn());
        }
        else{
          emit(GoogleError(message: "Error"));
        }
      }
      catch(e){
       emit(GoogleError(message: e.toString()));
      }
    });
  }
}
