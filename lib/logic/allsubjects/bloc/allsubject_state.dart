// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'allsubject_bloc.dart';

abstract class AllsubjectState extends Equatable {
  const AllsubjectState();
  
  @override
  List<Object> get props => [];
}

class AllsubjectInitial extends AllsubjectState {}
class AllsubjectLoading extends AllsubjectState {}
class AllsubjectGot extends AllsubjectState {
  List<AllSubjectModel> allSubjectModel;
  AllsubjectGot({
    required this.allSubjectModel,
  });
}
class AllsubjectError extends AllsubjectState {
  String message;
  AllsubjectError({
    required this.message,
  });
}
