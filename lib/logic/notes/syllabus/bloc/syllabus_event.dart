// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'syllabus_bloc.dart';

abstract class SyllabusEvent extends Equatable {
  const SyllabusEvent();

  @override
  List<Object> get props => [];
}

class SyllabusGettingEvent extends SyllabusEvent {
int id;
  SyllabusGettingEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
