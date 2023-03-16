// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'lab_bloc.dart';

abstract class LabEvent extends Equatable {
  const LabEvent();

  @override
  List<Object> get props => [];
}

class LabGettingEvent extends LabEvent {
  int id;
  LabGettingEvent({
    required this.id,
  });
   @override
  List<Object> get props => [id];
}
