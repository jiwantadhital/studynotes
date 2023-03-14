// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}
class ProfileGot extends ProfileState {
  ProfileModel profileModel;
  ProfileGot({
    required this.profileModel,
  });
  @override
  List<Object> get props => [profileModel];
}
class ProfileError extends ProfileState {
  String message;
  ProfileError({
    required this.message,
  });
    @override
  List<Object> get props => [message];
}
