part of 'question_bloc.dart';

abstract class QuestionState extends Equatable {
  const QuestionState();
  
  @override
  List<Object> get props => [];
}

class QuestionInitial extends QuestionState {}

class QuestionLoading extends QuestionState{}

class QuestionGot extends QuestionState {
  List<QuestionModel> questionModel;
  QuestionGot({
    required this.questionModel,
  });
   @override
  List<Object> get props => [questionModel];
}

class QuestionError extends QuestionState {
  String message;
  QuestionError({
    required this.message,
  });
   @override
  List<Object> get props => [message];
}