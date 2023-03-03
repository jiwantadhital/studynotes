import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/auth_controller.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthController authController;
  RegisterBloc({required this.authController}) : super(RegisterInitial()) {
    on<RegisteringEvent>((event, emit) async{
      emit(RegisterLoading());
      try{
        var registerData = await authController.register(event.email, event.password, event.phone, event.name);
        if(registerData.message=="successfull"){
          UserSimplePreferences.setToken(registerData.token.toString());
            UserSimplePreferences.setUserID(registerData.userId!.toInt());
            UserSimplePreferences.setUserName(registerData.student.toString());
            UserSimplePreferences.setOTP(registerData.otp!.toInt());
          emit(RegisterDone());
        }
        else{
          emit(RegisterError(message: registerData.message.toString()));
        }
      }
      catch(e){
        emit(RegisterError(message: "Something went wrong"));
      }
    });
  }
}
