// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'institute_bloc.dart';

abstract class InstituteState extends Equatable {
  const InstituteState();
  
  @override
  List<Object> get props => [];
}

class InstituteInitial extends InstituteState {}
class InstituteLoading extends InstituteState {}
class InstituteLoaded extends InstituteState {
  List<InstituteModel> instituteModel;
  InstituteLoaded({
    required this.instituteModel,
  });
    @override
  List<Object> get props => [instituteModel];
}
class InstituteError extends InstituteState {
  String error;
  InstituteError({
    required this.error,
  });
    @override
  List<Object> get props => [error];
}
