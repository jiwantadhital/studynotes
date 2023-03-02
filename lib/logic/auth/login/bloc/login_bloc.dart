import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/auth_controller.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/models/auth_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthController authController;
  LoginBloc({required this.authController}) : super(LoginInitial()) {
    on<LoggingEvent>((event, emit) async{
        emit(LoginLoading());
        try{
          var loginData = await authController.login(event.email, event.password);
          if(loginData.message=="successfull"){
            UserSimplePreferences.setToken(loginData.token.toString());
            UserSimplePreferences.setUserID(loginData.userId!.toInt());
            UserSimplePreferences.setUserName(loginData.userName.toString());
            if(UserSimplePreferences.getRemember()==true){
              UserSimplePreferences.setEmailPassword(event.email, event.password);
            }
            else if(UserSimplePreferences.getRemember()==false){
              UserSimplePreferences.removeEmailPassword();
            }
            emit(LoginDone());
          }
          else{
            emit(LoginError(message: loginData.message.toString()));
          }
        }
        catch(e){
            emit(LoginError(message: "Something went wrong"));
        }
    });
  }
}
