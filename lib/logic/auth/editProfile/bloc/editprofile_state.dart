// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'editprofile_bloc.dart';

abstract class EditprofileState extends Equatable {
  const EditprofileState();
  
  @override
  List<Object> get props => [];
}

class EditprofileInitial extends EditprofileState {}
class EditProfileLoading extends EditprofileState{}
class EditProfileEdited extends EditprofileState{}
class EditProfileError extends EditprofileState {
  String message;
  EditProfileError({
    required this.message,
  });
}
