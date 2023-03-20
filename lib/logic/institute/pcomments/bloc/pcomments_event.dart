// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pcomments_bloc.dart';

abstract class PcommentsEvent extends Equatable {
  const PcommentsEvent();

  @override
  List<Object> get props => [];
}

class PostingEvent extends PcommentsEvent {
  int rate;
  String desc;
  int id;
  int studentId;
  int collegeId;
  PostingEvent({
    required this.rate,
    required this.desc,
    required this.id,
    required this.studentId,
    required this.collegeId,
  });
  @override
  List<Object> get props => [rate,desc,id,studentId,collegeId];
}
