// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}
class RegisteringEvent extends RegisterEvent {
  String email;
  String name;
  String phone;
  String password;
  RegisteringEvent({
    required this.email,
    required this.name,
    required this.phone,
    required this.password,
  });
  @override
  List<Object> get props => [email,phone,password,name];
}
