// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'solutions_bloc.dart';

abstract class SolutionsState extends Equatable {
  const SolutionsState();
  
  @override
  List<Object> get props => [];
}

class SolutionsInitial extends SolutionsState {}
class SolutionsLoading extends SolutionsState {}
class SolutionsGot extends SolutionsState {
  List<SolutionModel> solutionModel;
  SolutionsGot({
    required this.solutionModel,
  });
    @override
  List<Object> get props => [solutionModel];
}
class SolutionsError extends SolutionsState {
  String message;
  SolutionsError({
    required this.message,
  });
    @override
  List<Object> get props => [message];
}
