// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pcomments_bloc.dart';

abstract class PcommentsState extends Equatable {
  const PcommentsState();
  
  @override
  List<Object> get props => [];
}

class PcommentsInitial extends PcommentsState {}
class PcommentsPosting extends PcommentsState {}
class PcommentsPosted extends PcommentsState {}
class PcommentsError extends PcommentsState {
  String error;
  PcommentsError({
    required this.error,
  });
    
  @override
  List<Object> get props => [error];
}
