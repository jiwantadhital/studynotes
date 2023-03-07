part of 'qyear_bloc.dart';

abstract class QyearState extends Equatable {
  const QyearState();
  
  @override
  List<Object> get props => [];
}

class QyearInitial extends QyearState {}

class QyearLoading extends QyearState{}

class QyearGot extends QyearState {
  List<QyearModel> qyearModel;
  QyearGot({
    required this.qyearModel,
  });
   @override
  List<Object> get props => [qyearModel];
}

class QyearError extends QyearState {
  String message;
  QyearError({
    required this.message,
  });
   @override
  List<Object> get props => [message];
}