part of 't_notice_bloc.dart';

abstract class TNoticeEvent extends Equatable {
  const TNoticeEvent();

  @override
  List<Object> get props => [];
}

class TNoticeGettingEvent extends TNoticeEvent{}