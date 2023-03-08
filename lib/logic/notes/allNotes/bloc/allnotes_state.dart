part of 'allnotes_bloc.dart';

abstract class AllnotesState extends Equatable {
  const AllnotesState();
  
  @override
  List<Object> get props => [];
}

class AllnotesInitial extends AllnotesState {}

class AllnotesLoading extends AllnotesState{}

class AllnotesGot extends AllnotesState {
  AllNotesModel allNotesModel;
  AllnotesGot({
    required this.allNotesModel,
  });
   @override
  List<Object> get props => [allNotesModel];
}

class AllnotesError extends AllnotesState {
  String message;
  AllnotesError({
    required this.message,
  });
   @override
  List<Object> get props => [message];
}