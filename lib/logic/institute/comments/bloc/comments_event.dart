// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'comments_bloc.dart';

abstract class CommentsEvent extends Equatable {
  const CommentsEvent();

  @override
  List<Object> get props => [];
}

class CommentsGettingEvent extends CommentsEvent {
  int id;
  CommentsGettingEvent({
    required this.id,
  });
  @override
  List<Object> get props => [id];
}
