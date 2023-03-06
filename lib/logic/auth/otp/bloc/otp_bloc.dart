import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/auth_controller.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  AuthController authController;
  OtpBloc({required this.authController}) : super(OtpInitial()) {
    on<OTPprocessEvent>((event, emit) async{
      emit(OtpLoading());
      try{
        var otpData = await authController.otp(event.num);
        if(otpData.message=="successfull"){
          UserSimplePreferences.setVerified(true);
          emit(OtpDone());
        }
        else if(otpData.message=="failed"){
          UserSimplePreferences.setVerified(false);
          emit(OtpError(message:" otpData.message.toString()"));
        }
      }
      catch(e){
        emit(OtpError(message: "Something went wrong"));
      }
    });
  }
}
