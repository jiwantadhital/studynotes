part of 'notices_bloc.dart';

abstract class NoticesEvent extends Equatable {
  const NoticesEvent();

  @override
  List<Object> get props => [];
}

class NoticeGetEvent extends NoticesEvent{
  
}
class NoticeFetchingEvent extends NoticesEvent{
  
}
