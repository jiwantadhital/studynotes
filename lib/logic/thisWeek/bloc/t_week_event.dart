part of 't_week_bloc.dart';

abstract class TWeekEvent extends Equatable {
  const TWeekEvent();

  @override
  List<Object> get props => [];
}

class TweekGettingEvent extends TWeekEvent{}