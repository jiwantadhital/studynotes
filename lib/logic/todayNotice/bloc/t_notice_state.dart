// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 't_notice_bloc.dart';

abstract class TNoticeState extends Equatable {
  const TNoticeState();
  
  @override
  List<Object> get props => [];
}

class TNoticeInitial extends TNoticeState {}
class TNoticeLoading extends TNoticeState {}
class TNoticeLoaded extends TNoticeState {
    List<NoticeModel> noticeModel;
  TNoticeLoaded({
    required this.noticeModel,
  });
 @override
  List<Object> get props => [noticeModel];
}
class TNoticeError extends TNoticeState {
  String message;
  TNoticeError({
    required this.message,
  });
   @override
  List<Object> get props => [message];
}
