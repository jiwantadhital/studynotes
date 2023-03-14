import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/auth_controller.dart';
import 'package:studynotes/models/auth_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  AuthController authController;
  ProfileBloc({required this.authController}) : super(ProfileInitial()) {
    on<GetProfileEvent>((event, emit) async{
      emit(ProfileLoading());
      try{
       var data = await authController.getProfile();
        emit(ProfileGot(profileModel: data));
      }
      catch(e){
        emit(ProfileError(message: "Something went wrong"));
      }
    });
  }
}
