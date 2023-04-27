// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notices_bloc.dart';

abstract class NoticesState extends Equatable {
final noticeModel;
  const NoticesState({
     this.noticeModel,
  });
  
  @override
  List<Object> get props => [];
}

class NoticesInitial extends NoticesState {}
class NoticesLoading extends NoticesState {}
class NoticesFetchLoading extends NoticesState {}
class NoticesGot extends NoticesState {
  @override
  List<NoticeModel> noticeModel;
  NoticesGot({
    required this.noticeModel,
  });
  @override
  List<Object> get props => [noticeModel];
}
class NoticesError extends NoticesState {
  String error;
  NoticesError({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}
