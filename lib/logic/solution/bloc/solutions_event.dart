// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'solutions_bloc.dart';

abstract class SolutionsEvent extends Equatable {
  const SolutionsEvent();

  @override
  List<Object> get props => [];
}

class SolutionGettingEvent extends SolutionsEvent {
  int id;
  int year_id;
  SolutionGettingEvent({
    required this.id,
    required this.year_id,
  });
   @override
  List<Object> get props => [id,year_id];
}
