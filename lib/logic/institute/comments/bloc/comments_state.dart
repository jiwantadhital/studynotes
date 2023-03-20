// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'comments_bloc.dart';

abstract class CommentsState extends Equatable {
  const CommentsState();
  
  @override
  List<Object> get props => [];
}

class CommentsInitial extends CommentsState {}
class CommentsLoading extends CommentsState {}
class CommentsLoaded extends CommentsState {
  List<CommentModel> commentModel;
  CommentsLoaded({
    required this.commentModel,
  });
    @override
  List<Object> get props => [commentModel];
}
class CommentsError extends CommentsState {
  String error;
  CommentsError({
    required this.error,
  });
    @override
  List<Object> get props => [error];
}
