// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoggingEvent extends LoginEvent {
  String email;
  String password;
  LoggingEvent({
    required this.email,
    required this.password,
  });
}
