// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'google_bloc.dart';

abstract class GoogleEvent extends Equatable {
  const GoogleEvent();

  @override
  List<Object> get props => [];
}

class GoogleLoginEvent extends GoogleEvent {
  String token;
  GoogleLoginEvent({
    required this.token,
  });
    @override
  List<Object> get props => [token];
}
