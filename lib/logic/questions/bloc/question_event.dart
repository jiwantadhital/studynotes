// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'question_bloc.dart';

abstract class QuestionEvent extends Equatable {
  const QuestionEvent();

  @override
  List<Object> get props => [];
}


class QuestionGettingEvent extends QuestionEvent {
int id;
int year_id;
  QuestionGettingEvent({
    required this.id,
    required this.year_id
  });

 @override
  List<Object> get props => [id];
}
