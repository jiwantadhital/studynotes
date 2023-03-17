// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'google_bloc.dart';

abstract class GoogleState extends Equatable {
  const GoogleState();
  
  @override
  List<Object> get props => [];
}

class GoogleInitial extends GoogleState {}
class GoogleLoading extends GoogleState {}
class GoogleLoggedIn extends GoogleState {}
class GoogleFirstTime extends GoogleState {}
class GoogleError extends GoogleState {
  String message;
  GoogleError({
    required this.message,
  });
    @override
  List<Object> get props => [message];
}

