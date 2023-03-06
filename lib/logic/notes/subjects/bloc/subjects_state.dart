part of 'subjects_bloc.dart';

abstract class SubjectsState extends Equatable {
  const SubjectsState();
  
  @override
  List<Object> get props => [];
}

class SubjectsInitial extends SubjectsState {}
class SubjectLoading extends SubjectsState{}

class SubjectGot extends SubjectsState {
  List<SubjectModel> subjectModel;
  SubjectGot({
    required this.subjectModel,
  });
   @override
  List<Object> get props => [subjectModel];
}

class SubjectError extends SubjectsState {
  String message;
  SubjectError({
    required this.message,
  });
   @override
  List<Object> get props => [message];
}