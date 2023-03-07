part of 'syllabus_bloc.dart';

abstract class SyllabusState extends Equatable {
  const SyllabusState();
  
  @override
  List<Object> get props => [];
}

class SyllabusInitial extends SyllabusState {}

class SyllabusLoading extends SyllabusState{}

class SyllabusGot extends SyllabusState {
  List<SyllabusModel> syllabusModel;
  SyllabusGot({
    required this.syllabusModel,
  });
   @override
  List<Object> get props => [syllabusModel];
}

class SyllabusError extends SyllabusState {
  String message;
  SyllabusError({
    required this.message,
  });
   @override
  List<Object> get props => [message];
}