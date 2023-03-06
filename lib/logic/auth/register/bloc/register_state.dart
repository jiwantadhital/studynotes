part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterOtp extends RegisterState {}
class RegisterDone extends RegisterState {}
class RegisterError extends RegisterState {
  String message;
  RegisterError({
    required this.message,
  });
}