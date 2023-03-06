part of 'semesters_bloc.dart';

abstract class SemestersState extends Equatable {
  const SemestersState();
  
  @override
  List<Object> get props => [];
}

class SemestersInitial extends SemestersState {}
class SemesterLoading extends SemestersState{}

class SemesterGot extends SemestersState {
  List<SemesterModel> semesterModel;
  SemesterGot({
    required this.semesterModel,
  });
   @override
  List<Object> get props => [semesterModel];
}

class SemesterError extends SemestersState {
  String message;
  SemesterError({
    required this.message,
  });
   @override
  List<Object> get props => [message];
}