// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'lab_bloc.dart';

abstract class LabState extends Equatable {
  const LabState();
  
  @override
  List<Object> get props => [];
}

class LabInitial extends LabState {}
class LabLoading extends LabState {}
class LabGot extends LabState {
  List<LabModel> labModel;
  LabGot({
    required this.labModel,
  });
   @override
  List<Object> get props => [labModel];
}
class LabError extends LabState {
  String message;
  LabError({
    required this.message,
  });
   @override
  List<Object> get props => [message];
}
