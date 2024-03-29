// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'subjects_bloc.dart';

abstract class SubjectsEvent extends Equatable {
  const SubjectsEvent();

  @override
  List<Object> get props => [];
}


class SubjectGettingEvent extends SubjectsEvent {
int id;
  SubjectGettingEvent({
    required this.id,
  });
  @override
  List<Object> get props => [id];
}
