part of 't_week_bloc.dart';

abstract class TWeekState extends Equatable {
  const TWeekState();
  
  @override
  List<Object> get props => [];
}

class TWeekInitial extends TWeekState {}
class TWeekLoading extends TWeekState {}
class TWeekLoaded extends TWeekState {
    List<NoticeModel> noticeModel;
  TWeekLoaded({
    required this.noticeModel,
  });
 @override
  List<Object> get props => [noticeModel];
}
class TWeekError extends TWeekState {
  String message;
  TWeekError({
    required this.message,
  });
   @override
  List<Object> get props => [message];
}
